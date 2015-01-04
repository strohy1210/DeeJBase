class SessionsController < ApplicationController
  skip_before_action :authorize

  def create
    @dj = Dj.get_user_from_omniauth(auth_hash)

    login(@dj)
    
    if @dj.dj_status == nil
      redirect_to dj_form_path
    elsif @dj.dj_status
      redirect_to dj_path(@dj)
    else
      redirect_to root_path
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
