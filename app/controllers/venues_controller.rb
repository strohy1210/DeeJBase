class VenuesController < ApplicationController
 
  def index
    @venues = Venue.paginate(page: params[:page], per_page: 6).order('updated_at DESC')

  end

  def show
    @venue = Venue.find(params[:id])

    @comments = @venue.comments.select {|c| c.is_valid? && c.valid? && c.rating.valid? && c.rating.score != 0}
    @comments = nil unless @comments.any?

    if logged_in?

      @rating = Rating.where(venue_id: @venue.id, user_id: current_user.id).first
      @rating ||= Rating.create(venue_id: @venue.id, user_id: current_user.id, score: 0)
      @comment = Comment.where(rating_id: @rating.id).first
      @comment ||= Comment.create(rating_id: @rating.id)
  
    else
      @rating = Rating.first
    end

  end
end
