require_relative '../config/environment'

require 'nokogiri'
require 'open-uri'
require 'pry'

class VenueData
  attr_accessor :venues_page
  
  def initialize
    params = []
    url = "http://www.residentadvisor.net/clubs.aspx"
    html = open(url)
    @venues_page = Nokogiri::HTML(html)
    binding.pry
  end

  def get_venue_data
    # //.collect do |venue|
    #   venue[name]= name.
    #   venue[address] = address 
    @venues_page.css('ul .fl .clearfix').collect do |venue|
      venue.css('a').text.strip

    end
    #store all names in an array
    #store all addressed in an array
    #iterate through each array
    #venue_info[name]=

  end

  def show_page
    puts @venues_page
  end
  # def get_names
  #   @events_page.css("div.bbox h1 span").collect do |location|
  #     @event_locations << location.text  
  #   end
  #   @venues
  # end
  
  # def get_addresses
  #   @events_page.css("div.bbox h1 span").collect do |location|
  #     @event_locations << location.text  
  #   end
  #   @venues
  # end

end

scraper = VenueData.new
# scraper.venues_page
# scraper.get_locations

#save in hash for this formate 
#venues=Venre.create([{name: xyz, address: pqr},{}])

#try @venues_page.css('ul .fl .clearfix').text
#ko
