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
    flash[:info]= "You're logged in!"
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
      @djs = @genre.djs.where(dj_status: true, agent_status: false).paginate(page: params[:page], per_page: 6).order('sdcl_followers ASC') if @filter=="scld_asc"
      @djs = @genre.djs.where(dj_status: true, agent_status: false).paginate(page: params[:page], per_page: 6).order('sdcl_followers DESC') if @filter=="scld_desc"
      @djs = @genre.djs.where(dj_status: true, agent_status: false).paginate(page: params[:page], per_page: 6).order('updated_at DESC') if @filter=="recent_desc"
    else
      @djs = Dj.is_dj.paginate(page: params[:page], per_page: 6).order('sdcl_followers ASC') if @filter=="scld_asc"
      @djs = Dj.is_dj.paginate(page: params[:page], per_page: 6).order('sdcl_followers DESC') if @filter=="scld_desc"
      @djs = Dj.is_dj.paginate(page: params[:page], per_page: 6).order('updated_at DESC') if @filter=="recent_desc"
    end
  end

  helper_method :current_user, :logged_in?, :set_params, :current_dj
end
