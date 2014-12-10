class Dj < ActiveRecord::Base
  has_many :genres
  has_many :events
  has_many :venues, through: :events
  accepts_nested_attributes_for :venues
  accepts_nested_attributes_for :genres, :reject_if => :all_blank

  
  def self.get_user_from_omniauth(auth_hash)
    self.find_with_omniauth(auth_hash) || self.create_with_omniauth(auth_hash)
  end

  def self.create_with_omniauth(auth_hash)    
    create(uid: auth_hash[:uid], name: auth_hash[:info][:name], image_url: auth_hash[:info][:image])
  end

  def self.find_with_omniauth(auth_hash)
    find_by(uid: auth_hash[:uid])
  end
end