class Dj < ActiveRecord::Base
  has_many :genres
  has_many :events
  has_many :venues, through: :events
  accepts_nested_attributes_for :genres, :reject_if => :all_blank
end
