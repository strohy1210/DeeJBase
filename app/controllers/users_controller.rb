class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if @user.comments
      @comments = @user.comments.select {|c| c.valid? && c.is_valid?}
    end
  end
end
