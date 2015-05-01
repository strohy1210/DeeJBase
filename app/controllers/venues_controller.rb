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
    if @comments
      @users = @comments.map {|comment| comment.user}
      comments_by_user = @users.map {|user| user.comments & @comments }
      @comments_uniq_by_user = comments_by_user.map {|c_array| c_array.last}.uniq
    end

    if logged_in?
      @events = @venue.events
      if @events
        @events.each do |event|
          @ratings = event.ratings.where(user: current_user) if event.ratings
        end
      end
      # @event = current_user.events.where(venue_id: @venue.id).first if current_user.events.any? && current_user.events.where(venue_id: @venue.id)
      # @event ||= Event.create(venue_id: @venue.id)
      # current_user.events << @event unless current_user.events.include? @event
      # @rating = current_user.ratings @event.ratings.where(user_id: current_user.id).first if @event.ratings.where(user_id: current_user.id).any?
      @rating = Rating.create(user_id: current_user.id, score: 0)
      @comment = Comment.find_by(rating_id: @rating.id)
      @comment ||= Comment.create(rating_id: @rating.id)

    else
      @rating = Rating.first
    end

  end
end
