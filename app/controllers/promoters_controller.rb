class PromotersController < ApplicationController

  def index
    @promoters = Promoter.order('rated_at ASC')
  end

  def show
    @promoter = Promoter.find_by(slug: params[:slug])
    @comments = @promoter.comments.select {|c| c.is_valid? && c.valid? && c.rating.valid? && c.rating.score != 0}
    @comments = nil unless @comments.any?
    if @comments
      @users = @comments.map {|comment| comment.user}
      comments_by_user = @users.map {|user| user.comments & @comments }
      @comments_uniq_by_user = comments_by_user.map {|c_array| c_array.last}.uniq
    end
    if logged_in?
      prepare_ratings(@promoter)
      @comment_fbshare =resource.ratings.where(user: current_user).valid_only.last.comment.body if resource.ratings && resource.ratings.where(user: current_user).valid_only.last && resource.ratings.where(user: current_user).valid_only.last.comment
    else
      @new_rating = Rating.first
    end
  end
end
