class SessionsController < ApplicationController
  skip_before_action :authorize

  def create
    @user = User.get_user_from_omniauth(auth_hash)

    login(@user)
   
    if @user.dj_status == nil
      redirect_to dj_form_path
    elsif @user.dj_status
      @dj = current_dj
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def destroy
    logout
    redirect_to root_path
  end

 private
   def auth_hash
     request.env['omniauth.auth']
   end
end
