class VenuesController < ApplicationController
 skip_before_action :authorize
  
  def index
    set_venue_params
  end

  def show
    if params["category"]
      set_venue_params
      render 'venues/index'
    end
 
    @venue = Venue.find_by(slug: params[:slug])
    @comments = @venue.comments.select {|c| c.is_valid? && c.valid? && c.rating.valid? && c.rating.score != 0}
    @comments = nil unless @comments.any?

    if logged_in?
      @event = current_user.events.where(venue_id: @venue.id).first if current_user.events.any? && current_user.events.where(venue_id: @venue.id)
      @event ||= Event.create(venue_id: @venue.id)
      current_user.events << @event unless current_user.events.include? @event
      @rating = @event.ratings.where(user_id: current_user.id).first if @event.ratings.where(user_id: current_user.id).any?
      @rating ||= Rating.create(event_id: @event.id, user_id: current_user.id, score: 0)
      @comment = Comment.where(rating_id: @rating.id).first
      @comment ||= Comment.create(rating_id: @rating.id)

    else
      @rating = Rating.first
    end

  end
end
