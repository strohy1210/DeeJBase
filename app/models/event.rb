class Event < ActiveRecord::Base
  belongs_to :dj
  belongs_to :venue
  belongs_to :promoter
  has_many :ratings
  has_many :comments, through: :ratings
  has_many :users, through: :ratings
  after_update :check_for_users
  after_create :update_venue_dj_rated_at

  def check_for_users
    destroy if users.blank?
  end

  def update_venue_dj_rated_at
    self.dj.update(rated_at: self.created_at) if self.dj
    self.venue.update(rated_at: self.created_at) if self.venue
  end
  
end
