class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  has_one :venue, through: :event
  has_one :dj, through: :event
  has_one :comment, :dependent => :destroy
  # validates_uniqueness_of :user_id, :scope => :dj_id, on: :update
  # validates_presence_of :score
  # after_update :unique_user_rating
  scope :valid_only, -> { where.not(score: 0).select {|r| r.comment && r.comment.valid? && r.comment.is_valid?} }
  
  # def unique_user_rating
  #   user = self.user
  #   dj = self.dj
  #   venue = self.venue
  #   event = self.event
  #   if event && user.ratings.valid_only.size > 1
  #     self.destroy
  #   end
  # end
end

#user cant have more than 1 rating per dj or venue

