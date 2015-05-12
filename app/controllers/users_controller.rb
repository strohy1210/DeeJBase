class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if @user.ratings
      @ratings = @user.ratings.valid_only
    end
  end
end
