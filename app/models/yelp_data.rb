class YelpData
  BAR_WORDS = ["Music Venues", "Dance Clubs", "Bars", "Lounges", "Cocktail Bars", "Dive Bars", "Pubs", "Adult Entertainment", "Champagne Bars", "Gay Bars", "Hookah Bars", "Hotels"]
  
  def self.remove_bad_data
    yelp = YelpData.new
    Venue.all.each do |venue|
      yelp = YELP.search('New York', { term: venue.name })
      words = yelp.businesses.first.categories.flatten if yelp.businesses.first    
      categories = BAR_WORDS & words 
      venue.update(category: categories.first) if categories.any?
      venue.destroy unless categories.any?
    end
  end

  def yelp_search(venue)
    begin
      yelp = YELP.search('New York', { term: venue.name })
    rescue
      puts yelp.text
    else
      yelp_venue = yelp.businesses.first
    end
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
      begin
        yelp_venue.location.neighborhoods.first
      rescue
        puts "no hood"
      else
        neighborhood = yelp_venue.location.neighborhoods.first
      end
      begin
        address = yelp_venue.location.address.first     
        latitude = yelp_venue.location.coordinate.latitude
        longitude = yelp_venue.location.coordinate.longitude
      rescue
        puts "no address"
      end
      begin
        yelp_venue.phone
      rescue
        puts "no phone"
      else
        phone = yelp_venue.phone
      end
      begin
        yelp_rating = yelp_venue.rating
      rescue
        puts "no rating"
      end
      begin
        yelp_venue.image_url
      rescue
        puts "no image"
      else
        image_url = yelp_venue.image_url
      end
      begin
        name= yelp_venue.name
      rescue
        puts "no name?"
      end
      venue.update(neighborhood: neighborhood, phone: phone, name: name, yelp_rating: yelp_rating, image_url: image_url, address: address, latitude: latitude, longitude: longitude, yelp_id: yelp_venue.id)
    end
    
  end
end