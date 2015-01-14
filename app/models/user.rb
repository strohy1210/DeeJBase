class User < ActiveRecord::Base
  has_many :ratings, dependent: :destroy
  has_many :comments, through: :ratings
  validates :email, :uniqueness => true

  def self.get_user_from_omniauth(auth_hash)
    self.find_with_omniauth(auth_hash) || self.create_with_omniauth(auth_hash)
  end

  def self.create_with_omniauth(auth_hash)    
    create(uid: auth_hash[:uid], name: auth_hash[:info][:name], image_url: auth_hash[:info][:image], first_name: auth_hash[:info][:first_name], gender: auth_hash[:extra]["raw_info"]["gender"])
  end

  def self.find_with_omniauth(auth_hash)
    find_by(uid: auth_hash[:uid])
  end


  
end
