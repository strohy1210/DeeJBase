class Venue < ActiveRecord::Base
  has_many :events
  has_many :djs, through: :events
  has_many :ratings
  has_many :comments, through: :ratings
  accepts_nested_attributes_for :events, :reject_if => :all_blank, :allow_destroy => true
  before_create :yelp
  
  def mapsify
    url = self.address.gsub(';',',').gsub(' ','+')
    'https://www.google.com/maps/place/'+url +'/'
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
    yelp.yelp_search(self)
    YelpData.remove_bad_data
  end

  def imageify
    "http://"+self.name.gsub(" ", "").downcase+"nyc.jpg.to/"
  end

end
