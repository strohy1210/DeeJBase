class Venue < ActiveRecord::Base
  has_many :events
  has_many :djs, through: :events
  has_many :ratings
  has_many :comments, through: :ratings
  belongs_to :neighborhood
  accepts_nested_attributes_for :events, :reject_if => :all_blank, :allow_destroy => true
  after_create :yelp
  before_save :update_slug
  
  def slugify
    name.gsub(" ", "-").gsub(".", "").downcase
  end

  def update_slug
    update(slug: slugify) unless slug == slugify
  end


  def mapsify
    self.name.gsub(';',',').gsub(' ','+')
    # 'https://www.google.com/maps/place/'+url +'/'
  end

  def average_rating
    valid_ratings = ratings.valid_only
    if valid_ratings.any?
      valid_ratings.map {|r| r.score}.sum / valid_ratings.size
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
