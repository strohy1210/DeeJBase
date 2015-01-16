class VenuesController < ApplicationController
  def index

    @venues = Venue.all
    render :layout => false
  end
end
