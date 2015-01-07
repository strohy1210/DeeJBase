class FbData

  def initialize(token)
    @graph = Koala::Facebook::API.new(token)
  end

  def self.get_fbpage_ids(token)
    @graph = Koala::Facebook::API.new(token)
    Dj.is_dj.each do |dj|
      dj.get_fbpage_id
    end
  end

  def self.get_likes_descriptions(token)
    @graph = Koala::Facebook::API.new(token)

    Dj.is_dj.each do |dj|
      
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

  def get_description_likes(dj)
     profile = @graph.get_object(dj.fbpage_id)
     dj.update(fb_bio: profile["bio"], fb_likes: profile["likes"])
  end


  def facebook_searchify(dj)
    dj.name.gsub(" ", "+")
  end


end