class Comment < ActiveRecord::Base
  belongs_to :rating
  has_one :user, through: :rating
  # validates :body, :length => { :minimum => 100 }, on: :update
  validates :rating_id, presence: :true, on: :update
end
