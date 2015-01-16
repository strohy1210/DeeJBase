class VenuesController < ApplicationController
  
  def index
    @venues = Venue.all
    render :layout => "venues"
  end

end
