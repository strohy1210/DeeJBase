class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authorize

  def logged_in?
   !!current_user
  end

  def current_user
    @current_user ||= Dj.find(session[:dj_id]) if session[:dj_id]
  end

  def login(user)
    flash[:info]= "You're logged in!"
    session[:dj_id] = @dj.id
  end  

  def logout
    session[:dj_id] = nil
  end

  def authorize
    if !logged_in?
      flash[:danger] = "Take two seconds to login above!"
     redirect_to(root_path)
    end
  end

  def set_params
    @filter = params[:filter]
    if params[:genre_id] && params[:genre_id] != 'all'
      @genre= Genre.find(params[:genre_id])
      @djs = @genre.djs.where(dj_status: true, agent_status: false).paginate(page: params[:page], per_page: 6).order('sdcl_followers ASC') if @filter=="scld_asc"
      @djs = @genre.djs.where(dj_status: true, agent_status: false).paginate(page: params[:page], per_page: 6).order('sdcl_followers DESC') if @filter=="scld_desc"
    else
      @djs = Dj.is_dj.paginate(page: params[:page], per_page: 6).order('sdcl_followers ASC') if @filter=="scld_asc"
      @djs = Dj.is_dj.paginate(page: params[:page], per_page: 6).order('sdcl_followers DESC') if @filter=="scld_desc"
    end
  end

  helper_method :current_user, :logged_in?, :set_params
end
