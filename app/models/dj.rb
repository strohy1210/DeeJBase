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

  def self.get_soundcloud_djs
    page_size =200
    client = Soundcloud.new(:client_id => 'ed094c22af47eec76cdc9d24005bcdec')
    # while i < 41
    # i += 1
    # :offset => page_size then :offset => page_size *2
    djs = client.get('/users', :q => 'New York', :limit=> page_size)
    djs.all.each do |dj|
      if dj.description != nil && dj.city.include? "New York" || dj.city.include? "NY"
        sdcld_followers = dj.followers_count
        email = dj.description.scan(/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i).first

        name = dj.username
        phone = 
        Dj.create(email: email, name: name, sdcld_followers: sdcld_followers, bio: dj.description, demo: , dj_status: true
      end
    end

  end
  def self.get_demos

  end

end
  
  # dj = client.get('/users', :q => 'imaginarynumbers').first
  # city = dj["city"]
  # contact = dj["description"]
  # followers =  dj["followers_count"]
