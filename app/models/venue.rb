class Venue < ActiveRecord::Base
  has_many :events
  has_many :djs, through: :events
  has_many :genres, through: :djs
  has_many :ratings, through: :events
  has_many :comments, through: :ratings
  belongs_to :neighborhood
  accepts_nested_attributes_for :events, :reject_if => :all_blank, :allow_destroy => true
  after_create :yelp, :default_values, :data_reminder
  before_save :update_slug
  validates_uniqueness_of :name

  def default_values
    update(rated_at: 6.months.ago)
  end

  def data_reminder
    puts 'get token here: https://developers.facebook.com/tools/explorer/145634995501895/'
    puts 'and call FbData.get_fb_info(token, resource)'
  end
  
  def slugify
    name.gsub(" ", "-").gsub(".", "").gsub("\\", "").downcase
  end

  def update_slug
    update(slug: slugify) unless slug == slugify
  end


  def mapsify
    self.name.gsub(';',',').gsub(' ','+')
    # 'https://www.google.com/maps/place/'+url +'/'
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
  
  def yelp
    yelp = YelpData.new
    yelp.yelp_search(self) if yelp_id == nil
    # YelpData.remove_bad_data
  end

  def imageify
    "http://"+self.name.gsub(" ", "").downcase+"nyc.jpg.to/"
  end


end
