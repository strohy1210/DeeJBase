class Event < ActiveRecord::Base
  belongs_to :dj
  belongs_to :venue
  belongs_to :promoter
  belongs_to :festival
  has_many :ratings, dependent: :destroy
  has_many :comments, through: :ratings
  has_many :users, through: :ratings
  after_update :check_for_users
  after_create :update_venue_dj_rated_at
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  def check_for_users
    destroy if users.blank?
  end

  def update_venue_dj_rated_at
    self.dj.update(rated_at: self.created_at) if self.dj
    self.venue.update(rated_at: self.created_at) if self.venue
    self.promoter.update(rated_at: self.created_at) if self.promoter
    self.festival.update(rated_at: self.created_at) if self.festival
  end
  
end
