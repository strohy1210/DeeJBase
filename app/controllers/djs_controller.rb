class DjsController < ApplicationController
  def index
    redirect_to root_path
  end

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
    @dj= Dj.find(params[:id])
    @genres = @dj.genres

  end

  def send_contact_email

    @dj = Dj.find(params[:dj][:id])
    @message = params[:dj][:message]
    name = @dj.name
   ContactDjMailer.contact_dj(@dj, @message).deliver
   flash[:success] = 'Message sent to '+name+'.'
   redirect_to :back
  end

  private
 
    def dj_params
      params.require(:dj).permit!
    end
end

