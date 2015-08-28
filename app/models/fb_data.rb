class FbData

  attr_accessor :graph
  
  def initialize(token)
    @graph = Koala::Facebook::API.new(token)
  end

  def self.get_fbpage_ids(token)
    fb = FbData.new(token)
    # Dj.is_dj.where(fbpage_id: nil).each do |dj|
    #   fb.get_fbpage_id(dj)
    # end
    Promoter.where(fbpage_id: nil).where.not(name: nil).each do |promoter|
      fb.get_fbpage_id(promoter)
    end
    Festival.where(fbpage_id: nil).where.not(name: nil).each do |festival|
      fb.get_fbpage_id(festival)
    end
    Venue.where(fbpage_id: nil).where.not(name: nil).each do |venue|
      fb.get_fbpage_id(venue)
    end
  end

  def self.get_fb_attributes(token)
    fb= FbData.new(token)
    # Dj.is_dj.where.not(fbpage_id: nil).where(fb_likes: nil).each do |dj|
    #   fb.get_fb_attributes(dj)    
    # end
    Promoter.where.not(fbpage_id: nil).where(fb_photo: nil).each do |promoter|
      fb.get_fb_attributes(promoter)
    end
    Festival.where.not(fbpage_id: nil).where(fb_photo: nil).each do |festival|
      fb.get_fb_attributes(festival)
    end
    Venue.where.not(fbpage_id: nil).where(fb_photo: nil).each do |venue|
      fb.get_fb_attributes(venue)
    end
  end
#make 'results' an attribute of the fbdata.new that changes with each call of the method
# rescuing errors?
  def get_fbpage_id(resource)
    fbn = facebook_searchify(resource)
    if fbn.present?
      results = @graph.get_object("search?q=#{fbn}&type=page")
      if results
        venue_categories = ["Arts/Entertainment/Nightlife", "Concert Venue" , "Nightlife" , "Restaurant" , "Company" , "Local Business" , "Bar"]
        festival_categories = ["Arts/Entertainment/Nightlife", "Community" , "Concert Venue" , "Nightlife" , "Music Award" , "Label" , "Company" , "Local Business", "Community Organization"]
        promoter_categories = ["Musician/band", "Arts/Entertainment/Nightlife", "Community" , "Concert Venue" , "Nightlife" , "Restaurant" , "Music Award" , "Label" , "Company" , "Local Business" , "Magazine" , "Bar" , "Community Organization"]
        if results.first && category = results.first["category"]
          resource.update(fbpage_id: results.first["id"]) if resource.class.name == "Venue" && venue_categories.include?(category)
          resource.update(fbpage_id: results.first["id"]) if resource.class.name == "Promoter" && promoter_categories.include?(category)
          resource.update(fbpage_id: results.first["id"]) if resource.class.name == "Festival" && festival_categories.include?(category)
        # elsif results.second && results.second["category"] == "Musician/band"
        #   dj.update(fbpage_id: results.second["id"])
        # elsif results[3] && results[3]["category"] == "Musician/band"
        #   dj.update(fbpage_id: results[3]["id"])
        # elsif results[4] && results[4]["category"] == "Musician/band"
        #   dj.update(fbpage_id: results[4]["id"])
        end
      end
    end    
  end

  def get_fb_attributes(resource)
    profile = @graph.get_object(resource.fbpage_id)
    if profile["about"]
      about = profile["about"]
    elsif profile["bio"]
      about = profile["bio"]
    elsif profile["description"]
      about = profile["description"]
    end
    if profile["cover"]["source"]
      fb_photo = profile["cover"]["source"]
    end
    link = profile["link"]
    fb_photo ||= nil
    about ||= nil
    link ||= nil
    resource.update(about: about, link: link, fb_photo: fb_photo)
  end

  def facebook_searchify(resource)
    resource.name.gsub(" ", "+")
  end


end