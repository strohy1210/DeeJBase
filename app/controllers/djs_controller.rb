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
    @dj.update(dj_params)
    if @dj.save
      flash[:success] = 'You\'re profile is updated!'
      redirect_to dj_path(@dj)
    else
      render 'new'
    end
  end

  def show
   # binding.pry
    @dj= Dj.find(params[:id])

  end

  private
 
    def dj_params
      params.require(:dj).permit!
    end
end
