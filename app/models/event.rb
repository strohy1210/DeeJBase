class Event < ActiveRecord::Base
  belongs_to :dj
  belongs_to :venue
  has_many :ratings
  has_many :comments, through: :ratings
  has_many :users, through: :ratings
  after_update :check_for_users
  after_create :update_venue_dj_rated_at

  def check_for_users
    destroy if users.blank?
  end

  def update_venue_dj_rated_at
    if self.dj
      self.dj.update(rated_at: self.created_at)
    elsif self.venue
      self.venue.update(rated_at: self.created_at)
    end
  end
end
