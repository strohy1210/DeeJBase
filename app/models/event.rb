class Event < ActiveRecord::Base
  belongs_to :dj
  belongs_to :venue
  has_many :ratings
  has_many :comments, through: :ratings
end
