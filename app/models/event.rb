class Event < ActiveRecord::Base
  belongs_to :dj
  belongs_to :venue
end
