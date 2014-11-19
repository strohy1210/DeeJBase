class Venue < ActiveRecord::Base
  has_many :events
  has_many :djs, through: :events

  def mapsify
    url = self.address.gsub(';',',').gsub(' ','+')
    'https://www.google.com/maps/place/'+url +'/'
  end
end
