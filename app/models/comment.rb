class Comment < ActiveRecord::Base
  belongs_to :rating
  has_one :user, through: :rating
  has_one :dj, through: :rating
  has_one :venue, through: :rating
  # validates :body, :length => { :minimum => 40, maximum: 300 }
  validates :rating_id, presence: :true, on: :update
  before_update :check_rating
  has_many :replies
  after_update :update_rated_at

  def check_rating
    rating.destroy unless rating.valid?
  end

  def is_valid?
    body.length >= 30 if body
  end

  def update_rated_at
    if self.dj && body.size > 30 && rating.score > 0
      dj.update(rated_at: self.updated_at)
    elsif self.venue && body.size > 30 && rating.score > 0
      venue.update(rated_at: self.updated_at)
    end
  end
end

