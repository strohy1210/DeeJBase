class Dj < ActiveRecord::Base
  has_many :dj_genres
  has_many :tracks
  has_many :genres, through: :dj_genres
  has_many :events
  has_many :venues, through: :events
  accepts_nested_attributes_for :venues
  before_save :default_values
  # scope :scld_asc, -> { order('sdcl_followers ASC') }
  # scope :scld_desc, -> { order('sdcl_followers DESC') }
  # scope :by_genre, -> genre { where(:genre => genre) }
  # scope :by_period, -> started_at, ended_at { where("started_at = ? AND ended_at = ?", started_at, ended_at) }

  NYC_WORDS = ["brooklyn", "new york", "staten", "queens", "manhattan", "bronx", "ny", "bklyn"]

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
      city = dj.city.downcase if dj.city
      bio = dj.description
      if city && bio && NYC_WORDS.any? { |w| city =~ /#{w}/ }   
        phone = dj.extract_phone_number(bio)
        email = bio.downcase.scan(/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i).first
        if dj.plan != "Free" && (email || phone)
          sdcl_followers = dj.followers_count
          image_url = dj.avatar_url
          name = dj.username
          sdcl_id = dj.id
          twitter_hdl = dj.extract_twitter_handle(bio)
          Dj.create(city: city, email: email, name: name, sdcl_followers: sdcl_followers, bio: bio, dj_status: true, sdcl_id: sdcl_id, phone: phone, image_url: image_url, twitter_hdl: twitter_hdl) if Dj.find_by(sdcl_id: sdcl_id)==nil
        end
      end
    end
  end


  def self.get_demos_genres
    client = Soundcloud.new(:client_id => 'ed094c22af47eec76cdc9d24005bcdec')  
    Dj.where(dj_status: true, agent_status: false).each do |dj|
      if dj.tracks.size == 0     
        begin
          tracks = client.get('/tracks', :q => dj.name)
        rescue Soundcloud::ResponseError => e
          puts "Error: #{e.message}, Status Code: #{e.response.code}"
        end
        if tracks
          get_genres(dj, tracks) if dj.genres.size < 1
          save_tracks(dj, tracks, client) if dj.tracks.size < 3
        end
      end
    end
  end

  def self.update_twitter
    Dj.where(twitter_hdl: nil).where.not(bio: nil).each do |dj|
      bio = dj.bio
      handle = dj.extract_twitter_handle(bio)
      dj.update(twitter_hdl: handle)
    end
  end

  private
    def self.save_tracks(dj, tracks, client)
      tracks[0..4].each do |track|
        Track.get_track_info(dj, track, client)
      end
    end

    def extract_twitter_handle(input)
      input.downcase!
      poss_handles = input.scan(/@\w+/)
      emails = input.scan(/@\w+(?=.co)/)
      handles = poss_handles - emails
      handles.first
    end

    
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

      
    def self.get_genres(dj, tracks)
      genres = []
      tracks.each do |track|
        string = track.tag_list
        t=Track.new
        t.string = string        
        genres << t.scan_for_genres        
      end
      dj.genres = genres.flatten.uniq
      dj.save   
    end


end

