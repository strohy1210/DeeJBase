class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :authorize

  def logged_in?
   !!current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def login(user)

    session[:user_id] = @user.id
  end  

  def logout
    session[:user_id] = nil
  end

  def authorize
    if !logged_in?
      flash[:danger] = "Take two seconds to login above!"
     redirect_to(root_path)
    end
  end

  def current_dj
    @dj ||= Dj.find_by(sdcl_id: current_user.sdcl_id) if session[:user_id]
  end

  def set_params
    @filter = params[:filter]
    if params[:genre_id] && params[:genre_id] != 'all'
      @genre= Genre.find(params[:genre_id])
      @djs = @genre.djs.is_dj.paginate(page: params[:page], per_page: 6).order('sdcl_followers ASC') if @filter=="scld_asc"
      @djs = @genre.djs.is_dj.paginate(page: params[:page], per_page: 6).order('sdcl_followers DESC') if @filter=="scld_desc"
      @djs = @genre.djs.is_dj.paginate(page: params[:page], per_page: 6).order('rated_at ASC') if @filter=="recent_desc"
    else
      @djs = Dj.is_dj.paginate(page: params[:page], per_page: 6).order('sdcl_followers ASC') if @filter=="scld_asc"
      @djs = Dj.is_dj.paginate(page: params[:page], per_page: 6).order('sdcl_followers DESC') if @filter=="scld_desc"
      @djs = Dj.is_dj.paginate(page: params[:page], per_page: 6).order('rated_at ASC') if @filter=="recent_desc"
    end
  end

  def set_venue_params
    @category = params["category"]
    if params["category"] && params["category"] != "all" && params[:neighborhood_id] != "all"
      @neighborhood = Neighborhood.find(params[:neighborhood_id])
      @venues = Venue.where(neighborhood_id: @neighborhood.id, category: @category).paginate(page: params[:page], per_page: 20).order('rated_at ASC')
      if @venues.blank?
        flash.now[:warning] = "No venues matching both the neighborhood and category, so here's the results for the hood."
        @venues = Venue.where(neighborhood_id: @neighborhood.id).paginate(page: params[:page], per_page: 20).order('rated_at ASC')
      end
    elsif params["category"] && params["category"] != "all" && params[:neighborhood_id] == "all"
      @venues = Venue.where(category: @category).paginate(page: params[:page], per_page: 20).order('rated_at ASC')
    elsif params["category"] == "all" && params[:neighborhood_id] && params[:neighborhood_id] != "all"
      @neighborhood = Neighborhood.find(params[:neighborhood_id])
      @venues = Venue.where(neighborhood_id: @neighborhood.id).paginate(page: params[:page], per_page: 20).order('rated_at ASC')
    else
      @venues = Venue.paginate(page: params[:page], per_page: 20).order('rated_at ASC')
    end

  end

  def prepare_ratings(resource)
    @comment_fbshare =resource.ratings.where(user: current_user).valid_only.last.comment.body if resource.ratings && resource.ratings.where(user: current_user).valid_only.last && resource.ratings.where(user: current_user).valid_only.last.comment 
    @rating_fbshare= resource.ratings.where(user: current_user).valid_only.last.score.to_i.to_s if resource.ratings && resource.ratings.where(user: current_user).valid_only.any?
    @events = resource.events
    if @events
      @events.each do |event|
        @ratings = event.ratings.where(user: current_user) if event.ratings
      end
    end
    # @event = current_user.events.where(venue_id: resource.id).first if current_user.events.any? && current_user.events.where(venue_id: resource.id)
    # @event ||= Event.create(venue_id: @venue.id)
    # current_user.events << @event unless current_user.events.include? @event
    # @rating = current_user.ratings @event.ratings.where(user_id: current_user.id).first if @event.ratings.where(user_id: current_user.id).any?
    @new_rating = Rating.create(user_id: current_user.id, score: 0)
    # @comment = Comment.find_by(rating_id: @rating.id)
    @comment = Comment.create(rating: @new_rating)
  end

  helper_method :current_user, :logged_in?, :set_params, :current_dj, :set_venue_params, :prepare_ratings
end
