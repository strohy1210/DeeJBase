class VenuesController < ApplicationController
 skip_before_action :authorize
 layout 'promoters'
  def index
    set_venue_params
    @resources = @venues
  end

  def show
    if params["category"]
      set_venue_params
      render 'venues/index'
    end
    @venue = Venue.find_by(slug: params[:slug])
    @comments = @venue.comments.order('created_at DESC').includes([:rating, :user, event: [:promoter, :dj]]).select {|c| c.is_valid? && c.valid? && c.rating.valid? && c.rating.score != 0}
    @comments = nil unless @comments.any?
    find_image(@venue)
    if @comments
      @users = @comments.map {|comment| comment.user}
      comments_by_user = @users.map {|user| user.comments.order('created_at DESC') & @comments }
      @comments_uniq_by_user = comments_by_user.map {|c_array| c_array.first}.uniq
    end
    
    if logged_in?
      prepare_ratings(@venue)
    else
      @new_rating = Rating.first
    end

  end
end
