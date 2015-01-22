class Rating < ActiveRecord::Base
  belongs_to :dj
  belongs_to :user
  belongs_to :venue
  has_one :comment, :dependent => :destroy
  # validates_uniqueness_of :user_id, :scope => :dj_id, on: :update
  # validates_presence_of :score
  after_update :unique_user_rating
  scope :valid_only, -> { where.not(score: 0).select {|r| r.comment.valid? && r.comment.is_valid?} }
  
  def unique_user_rating
    user = self.user
    dj = self.dj
    venue = self.venue
    if (dj && user.ratings.where.not(dj_id: nil).where(dj_id: dj.id).size > 1) || (venue && user.ratings.where.not(venue_id: nil).where(venue_id: venue.id).size > 1)
      self.destroy
    end
  end
end

#user cant have more thanthan 1 rating per dj or venue