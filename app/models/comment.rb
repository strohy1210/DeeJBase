class Comment < ActiveRecord::Base
  belongs_to :rating
  has_one :user, through: :rating
  # validates :body, :length => { :minimum => 40 }, on: :update
  validates :rating_id, presence: :true, on: :update
  before_update :check_rating

  def check_rating

    if rating.score == 0 || self.body.size < 20
      rating.destroy
      self.destroy
    end

  end
end
