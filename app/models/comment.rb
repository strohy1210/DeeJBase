class Comment < ActiveRecord::Base
  belongs_to :dj
  belongs_to :user
  belongs_to :venue
end
