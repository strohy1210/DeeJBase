class DjsController < ApplicationController
  # def index
  #   redirect_to
  # end

  def new
    @dj = Dj.new
  end

  def create
    @dj = Dj.new(dj_params)
    if @dj.save
      flash[:success] = 'You\'re signed up!'
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
 
    def dj_params
      params.require(:dj).permit!
    end
end
