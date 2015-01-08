class FbData

  def initialize(token)
    @graph = Koala::Facebook::API.new(token)
  end

  def self.get_fbpage_ids(token)
    fb= FbData.new(token)
    Dj.is_dj.each do |dj|
      fb.get_fbpage_id(dj)
    end
  end

  def self.get_fb_attributes(token)
    fb= FbData.new(token)
    Dj.is_dj.each do |dj|
      fb.get_fb_attributes(dj)    
    end   

  end

  def get_fbpage_id(dj)
    fbn = facebook_searchify(dj)
    results = @graph.get_object("search?q=#{fbn}&type=page")
    if results.first["category"] == "Musician/band"
      dj.update(fbpage_id: results.first["id"])
    elsif results.second["category"] == "Musician/band"
      dj.update(fbpage_id: results.second["id"])
    elsif results[3]["category"] == "Musician/band"
      dj.update(fbpage_id: results[3]["id"])
    end
      
  end

  def get_fb_attributes(dj)
    if profile["bio"]
      fb_bio = profile["bio"]
    else
      fb_bio = profile["description"]
    end
    profile = @graph.get_object(dj.fbpage_id)
    dj.update(fb_bio: fb_bio, fb_likes: profile["likes"], talking_about_count: profile["talking_about_count"], fb_location: profile["current_location"])
  end


  def facebook_searchify(dj)
    dj.name.gsub(" ", "+")
  end


end