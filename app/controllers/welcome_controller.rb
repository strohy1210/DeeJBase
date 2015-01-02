class WelcomeController < ApplicationController
  skip_before_action :authorize

  def index
    if params[:filter]
      set_params
    else
      @djs = Dj.where(dj_status: true, agent_status: false).paginate(page: params[:page], per_page: 6).order('created_at DESC')
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
    if params[:genre_id]
      set_params
      render 'welcome/index'
    end
  end

  def contact_us
    email = params["email"]
    if params[:message]
      message = params[:message]
    elsif params[:dj_status] == "true"
      message = "This person is a dj."
    elsif params[:agent_status] == "true"
      message = "This person hires djs."
    else
      message = "just wants updates"
    end
    ContactDjMailer.contact_us(email, message).deliver
    flash[:success] = 'Message sent.'
    redirect_to :back
  end
end
