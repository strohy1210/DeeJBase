class Rating < ActiveRecord::Base
  belongs_to :dj
  belongs_to :user
  belongs_to :venue
  has_one :comment, :dependent => :destroy
end
