class WelcomeController < ApplicationController
  skip_before_action :authorize
  
  def index
    # binding.pry
    if params[:genre_id] && params[:genre_id] != '8'
      @genre= Genre.find(params[:genre_id])
      @djs = Dj.all.select {|dj| dj.genres.include?(@genre)}
    else
      @djs = Dj.all 
    end

  end

  def dj_form

  end

  def set_dj
    if params["dj"]["dj_status"]=="false"
      status=false
    else
      status = true
    end
    current_user.update(dj_status: status)
    if current_user.dj_status
      @dj=current_user
      redirect_to dj_path(@dj)
    else
      redirect_to root_path
    end
  end

end
