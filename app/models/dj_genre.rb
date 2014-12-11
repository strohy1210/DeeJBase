class DjGenre < ActiveRecord::Base
  belongs_to :dj
  belongs_to :genre
end
