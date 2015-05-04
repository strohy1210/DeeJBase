class Comment < ActiveRecord::Base
  belongs_to :rating
  has_one :user, through: :rating
  has_one :event, through: :rating
  has_one :dj, through: :event
  has_one :venue, through: :event
  # validates :body, :length => { :minimum => 40, maximum: 300 }
  validates :rating_id, presence: :true, on: :update
  # before_update :check_rating

  # def check_rating
  #   rating.destroy unless rating.valid?
  # end

  def is_valid?
    body.length >= 40 if body
  end


end

