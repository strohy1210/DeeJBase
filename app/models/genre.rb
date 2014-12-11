class Genre < ActiveRecord::Base
  has_many :dj_genres
  has_many :djs, through: :dj_genres
end
