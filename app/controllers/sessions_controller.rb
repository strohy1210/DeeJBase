class SessionsController < ApplicationController
  skip_before_action :authorize

  def create
    @user = User.get_user_from_omniauth(auth_hash)

    login(@user)
   
    # if @user.dj_status == nil
    #   redirect_to djs_path #dj_form_path
    # elsif @user.dj_status
    #   @dj = current_dj
      # redirect_to djs_path
    # else
    begin
      flash[:info]= "You're logged in!"
      redirect_to :back
    rescue ActionController::RedirectBackError
      redirect_to venues_path
    end
  end

  def destroy
    logout
    redirect_to venues_path
  end

 private
   def auth_hash
     request.env['omniauth.auth']
   end
end
