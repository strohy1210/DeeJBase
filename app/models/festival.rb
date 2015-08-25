class Festival < ActiveRecord::Base
  has_many :events
  has_many :djs, through: :events
  has_many :ratings, through: :events
  has_many :comments, through: :ratings
  before_save :update_slug
  validates_uniqueness_of :name
  after_create :default_values

  def default_values
    update(rated_at: 6.months.ago)
  end

  def slugify
    name.gsub(" ", "-").gsub(".", "").downcase
  end

  def update_slug
    update(slug: slugify) unless slug == slugify
  end

  def average_rating
    if events.any?
      scores =[]
      events.each do |e|
        valid_ratings = e.ratings.valid_only
        if valid_ratings.any?
          scores << valid_ratings.map {|r| r.score}.sum / valid_ratings.size
        end
      end
      scores.sum/scores.size.to_f
    else
      0
    end
  end
end


