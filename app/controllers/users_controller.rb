class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if @user.ratings
      @ratings = @user.ratings.where.not(event_id: nil).select {|r| r.comment && r.comment.is_valid? && r.comment.valid? && r.valid? && r.score != 0}
    end
  end
end
