class DataHandler

  def self.un_dj(name)
    Dj.find_by(name: name).update(dj_status: false)
  end

  def self.agentfy(name)
    Dj.find_by(name: name).update(agent_status: true)
  end


  def self.slug_djs
    Dj.all.each do |dj|
     dj.update(slug: dj.slugify)
    end
  end

  def self.yelp_search(venue)
    YELP.search('New York', { term: venue }).businesses.first
  end

end