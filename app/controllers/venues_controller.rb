class VenuesController < ApplicationController
  
  def index
    @venues = Venue.paginate(page: params[:page], per_page: 6).order('updated_at DESC')
    render :layout => "application"
  end


end
