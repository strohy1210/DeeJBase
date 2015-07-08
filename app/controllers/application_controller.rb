class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :authorize
  # before_action :prepare_for_mobile


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

  def verify_admin
    unless current_user && (current_user.id == 15 || current_user.id == 7)
      flash[:alert] = "You must be an administrator to access this section"
      redirect_to root_path # halts request cycle
    end    
  end

  def set_params
    @filter = params[:filter]
    if params[:genre_id] && params[:genre_id] != 'all'
      @genre= Genre.find(params[:genre_id])
      @djs = @genre.djs.is_dj.paginate(page: params[:page], per_page: 10).order('sdcl_followers ASC') if @filter=="scld_asc"
      @djs = @genre.djs.is_dj.paginate(page: params[:page], per_page: 10).order('sdcl_followers DESC') if @filter=="scld_desc"
      @djs = @genre.djs.is_dj.paginate(page: params[:page], per_page: 10).order('rated_at DESC') if @filter=="recent_desc"
    else
      @djs = Dj.is_dj.paginate(page: params[:page], per_page: 10).order('sdcl_followers ASC') if @filter=="scld_asc"
      @djs = Dj.is_dj.paginate(page: params[:page], per_page: 10).order('sdcl_followers DESC') if @filter=="scld_desc"
      @djs = Dj.is_dj.paginate(page: params[:page], per_page: 10).order('rated_at DESC') if @filter=="recent_desc"
    end
  end

  def set_venue_params
    @category = params["category"]
    if params["category"] && params["category"] != "all" && params[:neighborhood_id] != "all"
      @neighborhood = Neighborhood.find(params[:neighborhood_id])
      @venues = Venue.where(neighborhood_id: @neighborhood.id, category: @category).paginate(page: params[:page], per_page: 30).order('priority').order('rated_at DESC')
      if @venues.blank?
        flash.now[:warning] = "No venues matching both the neighborhood and category, so here's the results for the hood."
        @venues = Venue.where(neighborhood_id: @neighborhood.id).paginate(page: params[:page], per_page: 30).order('priority').order('rated_at DESC')
      end
    elsif params["category"] && params["category"] != "all" && params[:neighborhood_id] == "all"
      @venues = Venue.where(category: @category).paginate(page: params[:page], per_page: 30).order('priority').order('rated_at DESC')
    elsif params["category"] == "all" && params[:neighborhood_id] && params[:neighborhood_id] != "all"
      @neighborhood = Neighborhood.find(params[:neighborhood_id])
      @venues = Venue.where(neighborhood_id: @neighborhood.id).paginate(page: params[:page], per_page: 30).order('priority').order('rated_at DESC')
    else
      @venues = Venue.paginate(page: params[:page], per_page: 30).order('priority').order('rated_at DESC')
    end

  end

  def prepare_ratings(resource)
    @comment_fbshare = resource.ratings.where(user: current_user).valid_only.last.comment.body if resource.ratings && resource.ratings.where(user: current_user).valid_only.last && resource.ratings.where(user: current_user).valid_only.last.comment 
    @rating_fbshare= resource.ratings.where(user: current_user).valid_only.last.score.to_i.to_s if resource.ratings && resource.ratings.where(user: current_user).valid_only.any?
    @events = resource.events
    if @events
      @events.each do |event|
        @ratings = event.ratings.where(user: current_user) if event.ratings
      end
    end   
    @new_rating = Rating.create(user_id: current_user.id, score: 0)
    @comment = Comment.create(rating: @new_rating)
  end


  private

  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      request.user_agent =~ /Mobile|webOS/
    end
  end

    def prepare_for_mobile
      session[:mobile_param] = params[:mobile] if params[:mobile]
      request.format = :mobile if mobile_device?
    end


  helper_method :current_user, :logged_in?, :set_params, :current_dj, :set_venue_params, :prepare_ratings, :mobile_device?
end
