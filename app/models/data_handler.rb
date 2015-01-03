class DataHandler

  def self.un_dj(name)
    Dj.find_by(name: name).update(dj_status: false)
  end

  def self.agentfy(name)
    Dj.find_by(name: name).update(agent_status: true)
  end

end