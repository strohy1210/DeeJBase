class FbData
  attr_accessor :graph
  def initialize(token)
    @graph = Koala::Facebook::API.new(token)
  end

  def self.get_fbpage_ids(token)
    fb= FbData.new(token)
    Dj.is_dj.where(fbpage_id: nil).each do |dj|
      fb.get_fbpage_id(dj)
    end
  end

  def self.get_fb_attributes(token)
    fb= FbData.new(token)
    Dj.is_dj.where.not(fbpage_id: nil).where(fb_likes: nil).each do |dj|
      fb.get_fb_attributes(dj)    
    end   
  end
#make 'results' an attribute of the fbdata.new that changes with each call of the method
# rescuing errors?
  def get_fbpage_id(dj)
    fbn = facebook_searchify(dj)
    results = @graph.get_object("search?q=#{fbn}&type=page")
    if results
      if results.first && results.first["category"] == "Musician/band"
        dj.update(fbpage_id: results.first["id"])
      elsif results.second && results.second["category"] == "Musician/band"
        dj.update(fbpage_id: results.second["id"])
      elsif results[3] && results[3]["category"] == "Musician/band"
        dj.update(fbpage_id: results[3]["id"])
      elsif results[4] && results[4]["category"] == "Musician/band"
        dj.update(fbpage_id: results[4]["id"])
      end
    end     
  end

  def get_fb_attributes(dj)
    profile = @graph.get_object(dj.fbpage_id)
    if profile["bio"]
      fb_bio = profile["bio"]
    else
      fb_bio = profile["description"]
    end
    dj.update(fb_bio: fb_bio, fb_likes: profile["likes"], talking_about_count: profile["talking_about_count"], fb_location: profile["current_location"])
  end


  def facebook_searchify(dj)
    dj.name.gsub(" ", "+")
  end


end