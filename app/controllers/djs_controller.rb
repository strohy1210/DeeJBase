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
    @dj = Dj.find(params[:id])
    genres= Genre.find(params[:genres])
    @dj.genres = genres
    @dj.save       
    params.select {|k,v| @dj.genres << k if v=="1" && k != "id"}
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
