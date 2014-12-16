class Dj < ActiveRecord::Base
  has_many :dj_genres
  has_many :genres, through: :dj_genres
  has_many :events
  has_many :venues, through: :events
  accepts_nested_attributes_for :venues

  attr_accessor :message
  
  def self.get_user_from_omniauth(auth_hash)
    self.find_with_omniauth(auth_hash) || self.create_with_omniauth(auth_hash)
  end

  def self.create_with_omniauth(auth_hash)    
    create(uid: auth_hash[:uid], name: auth_hash[:info][:name], image_url: auth_hash[:info][:image])
  end

  def self.find_with_omniauth(auth_hash)
    find_by(uid: auth_hash[:uid])
  end

  def extract_phone_number(input)
    if input.gsub(/\D/, "").match(/^1?(\d{3})(\d{3})(\d{4})/)
      [$1, $2, $3].join("-")
    end
  end

  def self.get_soundcloud_djs
    page_size =200
    client = Soundcloud.new(:client_id => 'ed094c22af47eec76cdc9d24005bcdec')
    # while i < 41
    # i += 1
    # :offset => page_size then :offset => page_size *2
    djs = client.get('/users', :q => 'New York', :limit=> page_size)
    djs.all.each do |dj|
      #only find ppl where "plan" != "Free", means their serious somewhat
      if dj.description != nil && dj.city.include? "New York" || dj.city.include? "NY"
        sdcl_followers = dj.followers_count
        email = dj.description.scan(/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i).first
        image_url = dj["avatar_url"]
        name = dj.username
        sdcl_id = dj.id
        bio = dj.description
        phone = extract_phone_number(bio)
        #webpage = dj.description.scan somethign
        Dj.create(email: email, name: name, sdcl_followers: sdcl_followers, bio: bio, dj_status: true, :sdcl_id: sdcl_id, phone: phone)
      end
    end

  end
  def self.get_demos
    client = Soundcloud.new(:client_id => 'ed094c22af47eec76cdc9d24005bcdec')
    Dj.where(demo: nil).each do |dj|
      track = client.get('/tracks', :q => dj.name, :limit=> 1)
      # track_url = track.track_url?
      # embed_info = client.get('/oembed', :url => track_url)
      # embed_info['html'] => the html for the embed player! i think
      # dj.update(demo: track_url )
      # https://developers.soundcloud.com/docs/api/guide#playing
    end
  end

end
  
  # dj = client.get('/users', :q => 'imaginarynumbers').first
  # city = dj["city"]
  # contact = dj["description"]
  # followers =  dj["followers_count"]
