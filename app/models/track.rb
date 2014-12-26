class Track < ActiveRecord::Base
  belongs_to :dj

  INDIE = ['indie', 'disco']
  ELECTRONIC = ["electronic", "progressive", "electro", "techno", "dance", "house", "disco", "trance", "tech", "trap", "edm"]
  TOP_40 = ["top 40", "pop"]
  HIP_HOP = ["hip hop", "rap"]
  REGGAE =["reggae", "dancehall", "drum"]
  DEEP_HOUSE = ["deep house", "trance", "progressive"]

  attr_accessor :string

  def self.get_track_info(dj, track, client)
    playback_count= track.playback_count
    favoritings_count = track.favoritings_count
    track_url = track.permalink_url
    title = track.title
    tag_list = track.tag_list
    t = Track.create(dj_id: dj.id, playback_count: playback_count, favoritings_count: favoritings_count, title: title, tag_list: tag_list)
    t.get_embed_info(client, track_url) if dj.tracks.size < 3
  end

  def get_embed_info(client, track_url)
    begin
    embed_info = client.get('/oembed', :url => track_url)
    rescue Soundcloud::ResponseError => e
    puts "Error: #{e.message}, Status Code: #{e.response.code}"
    end
    update(demo: embed_info['html']) if embed_info
  end
  
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
