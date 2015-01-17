class YelpData


  def yelp_search(venue)
    begin
      yelp = YELP.search('New York', { term: venue.name })
    rescue
      puts yelp.text
    end
    yelp_venue = yelp.businesses.first
    save_attributes(venue, yelp_venue) if yelp_venue
  end

  def self.yelp_venues
    yelp = YelpData.new
    Venue.all.each do |venue|
      yelp.yelp_search(venue) if venue.yelp_id == nil
    end
  end


  def save_attributes(venue, yelp_venue)
    if yelp_venue.location
      neighborhood = yelp_venue.location.neighborhoods.first
      address = yelp_venue.location.address.first
      latitude = yelp_venue.location.coordinate.latitude
      longitude = yelp_venue.location.coordinate.longitude
      begin
        phone = yelp_venue.phone
      rescue
        puts "no phone"
      else
        phone = yelp_venue.phone
      end
      yelp_rating = yelp_venue.rating
      image_url = yelp_venue.image_url
      name= yelp_venue.name
      venue.update(neighborhood: neighborhood, phone: phone, name: name, yelp_rating: yelp_rating, image_url: image_url, address: address, latitude: latitude, longitude: longitude, yelp_id: yelp_venue.id)
    end
    
  end
end