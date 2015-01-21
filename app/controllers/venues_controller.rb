class VenuesController < ApplicationController
 skip_before_action :authorize
  
  def index  
    if params["category"] && params["category"] != "all" && params[:neighborhood_id] != "all"
      @category = params["category"]
      @neighborhood = Neighborhood.find(params[:neighborhood_id])
      @venues = Venue.where(neighborhood_id: @neighborhood.id, category: @category).paginate(page: params[:page], per_page: 6).order('updated_at DESC')
      if @venues.blank?
        flash[:warning] = "No venues matching that neighborhood and category, so these are the results for the neighborhood."
        @venues = Venue.where(neighborhood_id: @neighborhood.id).paginate(page: params[:page], per_page: 6).order('updated_at DESC')
      end
    elsif params["category"] && params["category"] != "all" && params[:neighborhood_id] == "all"
      @venues = Venue.where(category: @category).paginate(page: params[:page], per_page: 6).order('updated_at DESC')
    elsif params["category"] == "all" && params[:neighborhood_id] && params[:neighborhood_id] != "all"
      @neighborhood = Neighborhood.find(params[:neighborhood_id])
      @venues = Venue.where(neighborhood_id: @neighborhood.id).paginate(page: params[:page], per_page: 6).order('updated_at DESC')
    else
      @venues = Venue.paginate(page: params[:page], per_page: 6).order('updated_at DESC')
    end
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
