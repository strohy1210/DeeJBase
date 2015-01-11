class Venue < ActiveRecord::Base
  has_many :events
  has_many :djs, through: :events
  has_many :ratings
  has_many :comments, through: :ratings
  def mapsify
    url = self.address.gsub(';',',').gsub(' ','+')
    'https://www.google.com/maps/place/'+url +'/'
  end
end
