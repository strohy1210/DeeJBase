class DjsController < ApplicationController
  skip_before_action :authorize
  def new
    @dj = Dj.new
  end

  def edit
   @dj = Dj.find(params[:id])
  end


  def update
    DjGenre.where(dj_id: params[:id]).destroy_all
    @dj = Dj.find(params[:id])
    @dj.genres = params["genres"].map {|g| Genre.find(g["id"])}

    @dj.update(dj_params)
    if @dj.save
      flash[:success] = 'Your profile is updated!'
      redirect_to dj_path(@dj)
    else
      render 'new'
    end
  end

  def show
    if params[:genre_id]
      set_params
      render 'welcome/index'
    end
    @dj= Dj.find(params[:id])
    @genres = @dj.genres
    @tracks = @dj.tracks.where.not(demo: nil)
    @rating = Rating.where(dj_id: @dj.id)
  end

  def send_contact_email  
    @email = params[:current_user][:email]
    @message = params[:dj][:message]
    phone = params[:current_user][:phone]
    @message << ". * The sender's phone is "+phone
    @dj = Dj.find(params[:dj][:id])
    name = @dj.name
    if current_user
      @sender = current_user
      @sender.update(current_user_params)
    else
      ContactDjMailer.contact_dj(@dj, @message, @email).deliver
    end
    flash[:success] = 'Message sent to '+name+'.'
    redirect_to :back
  end

  private
 
    def dj_params
      params.require(:dj).permit!
    end

    def current_user_params
      params.require(:current_user).permit!
    end
end

