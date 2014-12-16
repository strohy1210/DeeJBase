class WelcomeController < ApplicationController
  skip_before_action :authorize
  def index
    @djs = Dj.all
  end

  def dj_form

  end

  def set_dj
   
    current_user.update(dj_status: params[:dj][:dj_status])
    if params[:dj][:dj_status]
      @dj=current_user
      redirect_to dj_path(@dj)
    else
      redirect_to root_path
    end
  end

end
