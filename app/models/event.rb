class Event < ActiveRecord::Base
  belongs_to :dj
  belongs_to :venue
  has_many :ratings
  has_many :comments, through: :venue
  has_many :users, through: :ratings
  after_update :check_for_users

  def check_for_users
    destroy if users.blank?
  end
end
