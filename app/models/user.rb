class User < ActiveRecord::Base
  has_many :ratings
  has_many :comments, through: :ratings
  validates :email, :uniqueness => true

  def self.get_user_from_omniauth(auth_hash)
    self.find_with_omniauth(auth_hash) || self.create_with_omniauth(auth_hash)
  end

  def self.create_with_omniauth(auth_hash)    
    create(uid: auth_hash[:uid], name: auth_hash[:info][:name], image_url: auth_hash[:info][:image])
  end

  def self.find_with_omniauth(auth_hash)
    find_by(uid: auth_hash[:uid])
  end

  def self.find_with_sdcl(sdcl_id)
    find_by(sdcl_id: sdcl_id)
  end

  
end
