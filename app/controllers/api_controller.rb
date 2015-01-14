class ApiController < ApplicationController

  def index
    render 'api/index'
  end

  def djs
    @djs = Venue.all
    render json: {data: @djs}
  end

  def show_dj
    @dj = Dj.find(params[:id])
    render json: {data: @dj} 
  end



end