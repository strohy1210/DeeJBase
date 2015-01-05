class DataHandler

  def self.un_dj(name)
    Dj.find_by(name: name).update(dj_status: false)
  end

  def self.agentfy(name)
    Dj.find_by(name: name).update(agent_status: true)
  end

  def get_fbpage_ids
    Dj.is_dj.each do |dj|
      
    end
  end

end