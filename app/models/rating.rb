class Rating < ActiveRecord::Base
  belongs_to :dj
  belongs_to :user
  belongs_to :venue
  has_one :comment, :dependent => :destroy
  validates_uniqueness_of :user_id, :scope => :dj_id
  # validates_presence_of :score
  scope :valid_only, -> { where.not(score: 0).select {|r| r.comment.valid?} }

end
