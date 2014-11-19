require_relative '../config/environment'

require 'nokogiri'
require 'open-uri'
# require 'pry'

class EventsData
  attr_accessor :events_page

  def initialize
    @event_names = []
    @event_locations = []
    date_array = Time.now.to_s.split.first.split('-')
    month=date_array[1]
    year=date_array[0]
    day=date_array[2]
    url = "http://www.residentadvisor.net/events.aspx?ai=8&v=day&mn=#{month}&yr=#{year}&dy=#{day}"
    html = open(url)
    @events_page = Nokogiri::HTML(html)
  end

  def get_names
    @events_page.css("div.bbox h1 span").collect do |location|
      @event_locations << location.text  
    end
    @event_locations
  end
  
  def get_locations
    @event_locations = @event_locations.join.gsub("at ", ",").split(",")
    @event_locations.delete_at(0)

    @events_page.css("div.bbox h1 a").collect do |event|
      @event_names << event.text unless @event_locations.include? event.text
    end
    puts @event_names
  end

  def show_page
    puts @events_page
  end

end


scraper = EventsData.new.show_page
# scraper.get_locations



