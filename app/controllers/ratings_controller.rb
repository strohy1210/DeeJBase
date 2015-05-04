class RatingsController < ApplicationController
    skip_before_action :authorize

  def update
    @rating = Rating.find(params[:id])
    params[:score] = 0 if params[:score].blank?
    @dj = @rating.dj
    @venue = @rating.venue
    if @rating.valid? && @rating.update(score: params[:score])
      respond_to do |format|
        format.js
      end
    end
  end

  def create
    # binding.pry

  end


end
