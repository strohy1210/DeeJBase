class Track

  @@indie = Genre.find_by(name: "Indie")
  @@electronic = Genre.find_by(name: "Electronic")
  @@top_40 = Genre.find_by(name: "Top-40")  
  @@hip_hop = Genre.find_by(name: "Hip Hop")
  @@reggae = Genre.find_by(name: "Reggae/Dance Hall")
  @@deep_house = Genre.find_by(name: "Deep House")

  INDIE = ['indie', 'disco']
  ELECTRONIC = ["electronic", "progressive", "electro", "techno", "dance", "house", "disco", "trance", "tech", "trap", "edm"]
  TOP_40 = ["top 40", "pop"]
  HIP_HOP = ["hip hop", "rap"]
  REGGAE =["reggae", "dancehall", "drum"]
  DEEP_HOUSE = ["deep house", "trance", "progressive"]

  attr_accessor :string

  def initialize(string)
    @string=string.downcase
  end
  
  def scan_for_genres #string will be tag_list
    @genres = []
    @genres << @@indie if INDIE.any? { |w| string =~ /#{w}/ }
    @genres << @@electronic if ELECTRONIC.any? { |w| string =~ /#{w}/ }
    @genres << @@top_40 if TOP_40.any? { |w| string =~ /#{w}/ }
    @genres << @@hip_hop if HIP_HOP.any? { |w| string =~ /#{w}/ }
    @genres << @@reggae if REGGAE.any? { |w| string =~ /#{w}/ }
    @genres << @@deep_house if DEEP_HOUSE.any? { |w| string =~ /#{w}/ }  
    @genres
  end




end
