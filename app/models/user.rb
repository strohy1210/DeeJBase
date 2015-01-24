class User < ActiveRecord::Base
  has_many :ratings, dependent: :destroy
  has_many :comments, through: :ratings
  after_create :new_user_email


  def self.get_user_from_omniauth(auth_hash)
    self.find_with_omniauth(auth_hash) || self.create_with_omniauth(auth_hash)
  end

  def self.create_with_omniauth(auth_hash)
    create(uid: auth_hash[:uid], name: auth_hash[:info][:name], image_url: auth_hash[:info][:image])
  end

  def self.find_with_omniauth(auth_hash)
    find_by(uid: auth_hash[:uid])
  end

  def update_first_name
    update(first_name: name.split.first) if first_name.blank?
  end

  def new_user_email
    AdminNotification.new_user(self).deliver
  end
end
