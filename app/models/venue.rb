class Venue < ActiveRecord::Base
  has_many :events
  has_many :djs, through: :events
  has_many :ratings
  has_many :comments, through: :ratings
  
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
  
end
