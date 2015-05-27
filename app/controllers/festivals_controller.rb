class FestivalsController < ApplicationController
  def index
    @festivals = Festival.all
  end

  def show
    @festival = Festival.find_by(slug: params[:slug])
    @comments = @festival.comments.select {|c| c.is_valid? && c.valid? && c.rating.valid? && c.rating.score != 0}
    @comments = nil unless @comments.any?
    if @comments
      @users = @comments.map {|comment| comment.user}
      comments_by_user = @users.map {|user| user.comments & @comments }
      @comments_uniq_by_user = comments_by_user.map {|c_array| c_array.last}.uniq
    end

    if logged_in?
      prepare_ratings(@festival)
    else
      @new_rating = Rating.first
    end
  end
end
