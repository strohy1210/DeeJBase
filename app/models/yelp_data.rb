class YelpData


  def yelp_search(venue)
    yelp_venue = YELP.search('New York', { term: venue.name }).businesses.first
    save_attributes(venue, yelp_venue) if yelp_venue
  end

  def self.yelp_venues
    yelp = YelpData.new
    Venue.all.each do |venue|
      yelp.yelp_search(venue)
    end
  end


  def save_attributes(venue, yelp_venue)
    if yelp_venue.location.cross_streets
      cross_streets = yelp_venue.location.cross_streets
    else
      cross_streets = "x"
    end

    neighborhood = yelp_venue.location.neighborhoods.first
    phone = yelp_venue.phone
    yelp_rating = yelp_venue.rating
    image_url = yelp_venue.image_url
    address = yelp_venue.location.address.first
    name= yelp_venue.name
    latitude = yelp_venue.location.coordinate.latitude
    longitude = yelp_venue.location.coordinate.longitude
    venue.update(cross_streets: cross_streets, neighborhood: neighborhood, phone: phone, name: name, yelp_rating: yelp_rating, image_url: image_url, address: address, latitude: latitude, longitude: longitude, yelp_id: yelp_venue.id)
  end
end