class Neighborhood < ActiveRecord::Base
  has_many :venues

  def self.create_hoods
    Venue.where.not(hood: nil).each do |venue|
      name = venue.hood
      neighborhood = Neighborhood.find_by(name: name) || neighborhood = Neighborhood.create(name: name)
      venue.update(neighborhood_id: neighborhood.id)
    end
  end
end
