class RatingsController < ApplicationController
  def update
    @rating = Rating.find(params[:id])
    params[:score] = 0 if params[:score].blank?
    @dj = @rating.dj
    if @rating.update(score: params[:score])
      respond_to do |format|
        format.js
      end
    end
  end


end
