class WelcomeController < ApplicationController
  skip_before_action :authorize
  
  def index
    if params[:genre_id] && params[:genre_id] != 'all'
      @genre= Genre.find(params[:genre_id])
      @djs = @genre.djs.where(dj_status: true, agent_status: false).paginate(page: params[:page], per_page: 6).order('sdcl_followers DESC')
    elsif params[:filter]
      @filter = params[:filter]
      @djs = Dj.where(dj_status: true, agent_status: false).paginate(page: params[:page], per_page: 6).order('sdcl_followers DESC') if @filter=="scld_desc"
      @djs = Dj.where(dj_status: true, agent_status: false).paginate(page: params[:page], per_page: 6).order('sdcl_followers ASC') if @filter=="scld_asc"
    else
      @djs = Dj.where(dj_status: true, agent_status: false).paginate(page: params[:page], per_page: 6).order('sdcl_followers DESC')
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

  def contact_us

    email = params[:email]
    message = params[:message]
    ContactDjMailer.contact_us(email, message).deliver
    flash[:success] = 'Message sent.'
    redirect_to :back
  end
end
