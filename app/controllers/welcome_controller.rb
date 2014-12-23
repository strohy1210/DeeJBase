class WelcomeController < ApplicationController
  skip_before_action :authorize
  
  def index  
    if params[:genre_id] && params[:genre_id] != 'all'
      @genre= Genre.find(params[:genre_id])
      @djs = @genre.djs.paginate(page: params[:page], per_page: 8).order('created_at DESC')
    else
      @djs = Dj.paginate(page: params[:page], per_page: 8).order('created_at DESC')
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
  
  def about

  end
end
