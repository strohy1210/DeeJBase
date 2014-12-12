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
      flash[:success] = 'You\'re profile is updated!'
      redirect_to dj_path(@dj)
    else
      render 'new'
    end
  end

  def show
    @dj= Dj.find(params[:id])
    @genres = @dj.genres

  end

  private
 
    def dj_params
      params.require(:dj).permit!
    end
end

