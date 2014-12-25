class Track < ActiveRecord::Base
  belongs_to :dj

  INDIE = ['indie', 'disco']
  ELECTRONIC = ["electronic", "progressive", "electro", "techno", "dance", "house", "disco", "trance", "tech", "trap", "edm"]
  TOP_40 = ["top 40", "pop"]
  HIP_HOP = ["hip hop", "rap"]
  REGGAE =["reggae", "dancehall", "drum"]
  DEEP_HOUSE = ["deep house", "trance", "progressive"]

  attr_accessor :string

  
  def scan_for_genres #string will be tag_list
    string.downcase!
    @genres = []
    @genres << Genre.find_by(name: "Indie") if INDIE.any? { |w| string =~ /#{w}/ }
    @genres << Genre.find_by(name: "Electronic") if ELECTRONIC.any? { |w| string =~ /#{w}/ }
    @genres << Genre.find_by(name: "Top-40") if TOP_40.any? { |w| string =~ /#{w}/ }
    @genres << Genre.find_by(name: "Hip Hop") if HIP_HOP.any? { |w| string =~ /#{w}/ }
    @genres << Genre.find_by(name: "Reggae/Dance Hall") if REGGAE.any? { |w| string =~ /#{w}/ }
    @genres << Genre.find_by(name: "Deep House") if DEEP_HOUSE.any? { |w| string =~ /#{w}/ }  
    @genres
  end

end
