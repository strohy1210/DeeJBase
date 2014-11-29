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


  helper_method :current_user, :logged_in?

end
