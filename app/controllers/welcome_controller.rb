class WelcomeController < ApplicationController
  skip_before_action :authorize

  def index

    if params[:filter]
      set_params
    else
      @djs = Dj.is_dj.order('rated_at ASC').paginate(page: params[:page], per_page: 6)
    end
  end

  def dj_form

  end

  def set_dj
    if params["user"]["dj_status"]=="false"
      status=false
    else
      status=true
    end
    sdcl_id = params["user"]["sdcl_id"].to_i
    if status
      if @dj= Dj.find_by(sdcl_id: sdcl_id)
        @dj.update(uid: current_user.uid)
        current_user.update(dj_status: status, sdcl_id: sdcl_id)
        redirect_to dj_path(@dj.slugify)
      else
        flash[:danger] = "Incorrect pin. If you're not a DJ, select 'I'm just browsing'. If you are, try re-entering the pin or click 'Contact' above, and we'll help you get one."
        redirect_to :back
      end
    else
      current_user.update(dj_status: status)
      redirect_to djs_path
    end
  end

  def about
    if params[:genre_id]
      set_params
      render 'welcome/index', layout: "venues"
    end
    render layout: "venues"
  end

  def contact_us

    email = params["email"]
    if params[:message]
      message = params[:message]
    elsif params[:dj_status] == "true"
      message = "This person is a dj."
    elsif params[:agent_status] == "true"
      message = "This person hires djs."
    elsif params[:mailing]
      message = "Sign up for mailing list!"
    else
      message = "just wants updates"
    end
    ContactDjMailer.contact_us(email, message).deliver
    flash[:success] = 'Message sent.'
    redirect_to :back
  end

  private
    def current_user_params
      params.require(:user).permit!
    end
end
