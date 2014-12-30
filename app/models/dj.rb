class Dj < ActiveRecord::Base
  has_many :ratings
  has_many :dj_genres
  has_many :tracks
  has_many :genres, through: :dj_genres
  has_many :events
  has_many :venues, through: :events
  accepts_nested_attributes_for :tracks, :reject_if => :all_blank, :allow_destroy => true
  before_save :default_values, :remove_empty_tracks

  scope :is_dj, -> { where(dj_status: true, agent_status: false) }


  NYC_WORDS = ["brooklyn", "new york", "staten", "queens", "manhattan", "bronx", "ny", "bklyn"]

  attr_accessor :message, :demo_title

  def default_values
    self.bio ||= 'I\'m a DJ in NYC, get in touch'
  end

  def no_tracks
    update(dj_status: false) if tracks.blank?
  end

  def remove_empty_tracks
    if tracks
      tracks.each do |track|
        track.no_demo
      end
    end
  end

  def un_dj
    Dj.find_by(name: name).update(dj_status: false)
  end

  def agentfy
    Dj.find_by(name: name).update(agent_status: true)
  end
  
  def average_rating
    ratings.sum(:score) / ratings.size
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

  def avg_playback_count
    playbacks = tracks.map {|track| track.playback_count}
    playbacks.inject(0.0) { |sum, el| sum + el } / playbacks.size
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
          Dj.create(city: city, email: email, name: name, sdcl_followers: sdcl_followers, bio: bio, dj_status: true, sdcl_id: sdcl_id, phone: phone, image_url: image_url, twitter_hdl: twitter_hdl) if Dj.find_by(sdcl_id: sdcl_id).blank?
        end
      end
    end
  end


  def self.get_demos_genres
    client = Soundcloud.new(:client_id => 'ed094c22af47eec76cdc9d24005bcdec')  
    Dj.is_dj.each do |dj|
      if dj.tracks.blank?    
        begin
          tracks = client.get('/tracks', :q => dj.name)
        rescue Soundcloud::ResponseError => e
          puts "Error: #{e.message}, Status Code: #{e.response.code}"
        end
        if tracks
          get_genres(dj, tracks) if dj.genres.blank?
          save_tracks(dj, tracks, client) if dj.tracks.size < 3
        end
      end
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
        if !track.tag_list.blank?
          string = track.tag_list
          t=Track.new
          t.string = string        
          genres << t.scan_for_genres  
        end
      end
      dj.genres = genres.flatten.uniq
      dj.save
    end


end

  # def self.update_twitter
  #   Dj.where(twitter_hdl: nil).where.not(bio: nil).each do |dj|
  #     bio = dj.bio
  #     handle = dj.extract_twitter_handle(bio)
  #     dj.update(twitter_hdl: handle)
  #   end
  # end

  # def self.update_genres
  #   Dj.where(dj_status: true, agent_status: false).each do |dj|
  #     tracks = dj.tracks
  #     Dj.get_genres(dj, tracks)
  #   end

  # end

