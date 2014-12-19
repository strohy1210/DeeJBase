class Dj < ActiveRecord::Base
  has_many :dj_genres
  has_many :genres, through: :dj_genres
  has_many :events
  has_many :venues, through: :events
  accepts_nested_attributes_for :venues
  before_save :default_values

  NYC_WORDS = ["brooklyn", "new york", "staten", "queens", "manhatten", "bronx", "ny", "bklyn"]

  attr_accessor :message, :demo_title

  def default_values
    self.bio ||= 'I\'m a DJ in NYC, get in touch'
  end
  
  def self.get_user_from_omniauth(auth_hash)
    self.find_with_omniauth(auth_hash) || self.create_with_omniauth(auth_hash)
  end

  def self.create_with_omniauth(auth_hash)    
    create(uid: auth_hash[:uid], name: auth_hash[:info][:name], image_url: auth_hash[:info][:image])
  end

  def self.find_with_omniauth(auth_hash)
    find_by(uid: auth_hash[:uid])
  end

  def self.create_sc_djs(page)
    self.get_soundcloud_djs(page).each do |dj|
      city = dj.city
      if city && dj.description && NYC_WORDS.any? { |w| city =~ /#{w}/ }
        email = dj.description.scan(/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i).first
        if dj.plan != "Free" && email
          sdcl_followers = dj.followers_count
          image_url = dj.avatar_url
          name = dj.username
          sdcl_id = dj.id
          bio = dj.description
          phone = dj.extract_phone_number(bio)
          Dj.create(city: city, email: email, name: name, sdcl_followers: sdcl_followers, bio: bio, dj_status: true, sdcl_id: sdcl_id, phone: phone, image_url: image_url) if Dj.find_by(sdcl_id: sdcl_id)==nil
        end
      end
    end
  end

  def self.get_demos_genres
    client = Soundcloud.new(:client_id => 'ed094c22af47eec76cdc9d24005bcdec')
    Dj.where(demo: nil, dj_status: true).each do |dj|
      tracks = client.get('/tracks', :q => dj.name)
      first_track = tracks.first if tracks.first
      get_demos(dj, first_track, client) if first_track
      get_genres(dj, tracks) if first_track && dj.genres.size == 0
    end
  end
  
  private
    
    def self.get_soundcloud_djs(page)      
      client = Soundcloud.new(:client_id => 'ed094c22af47eec76cdc9d24005bcdec')
      page_size =200
      client.get('/users', :q => 'New York', :limit=> page_size, :offset => (page-1)*page_size)
    end
    
    def extract_phone_number(input)
      if input.gsub(/\D/, "").match(/^1?(\d{3})(\d{3})(\d{4})/)
        [$1, $2, $3].join("-")
      end
    end

      
    def self.get_demos(dj, first_track, client)
      track_url= first_track.permalink_url
      embed_info = client.get('/oembed', :url => track_url)
      dj.update(demo: embed_info['html']) if embed_info
    end

    def self.get_genres(dj, tracks)
      genres = []
      tracks.each do |track|
        string = track.tag_list
        t=Track.new(string)         
        genres << t.scan_for_genres        
      end
      dj.genres = genres.flatten.uniq
      dj.save   
    end
  # def self.get_websites(string)
  #   URI.extract(string)
  # end


  # def self.set_est_rph
  #   Dj.where(rate_per_hour: nil, dj_status: true).where.not(sdcl_followers: nil).each do |dj|
  #     # dj.sdcl_followers
  #     # get average followers

  #   end
  # end


end

