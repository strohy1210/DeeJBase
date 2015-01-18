class Comment < ActiveRecord::Base
  belongs_to :rating
  has_one :user, through: :rating
  # validates :body, :length => { :minimum => 40, maximum: 300 }
  validates :rating_id, presence: :true, on: :update
  # validates_presence_of :body, on: :update
  before_update :check_rating

  def check_rating
    rating.destroy unless rating.valid?
  end

  def is_valid?
    body.length >= 30 if body
  end
end
