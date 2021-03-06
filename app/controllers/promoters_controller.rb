class PromotersController < ApplicationController

  def index
    @promoters = Promoter.order('rated_at DESC').paginate(page: params[:page], per_page: 36)
    @resources = @promoters
    render 'venues/index'
  end

  def show
    @promoter = Promoter.find_by(slug: params[:slug])
    @comments = @promoter.comments.order('created_at DESC').includes([:rating, :user, event: [:venue, :dj]]).select {|c| c.is_valid? && c.valid? && c.rating.valid? && c.rating.score != 0}
    @comments = nil unless @comments.any?
    find_image(@promoter)
    if @comments
      @users = @comments.map {|comment| comment.user}
      comments_by_user = @users.map {|user| user.comments.order('created_at DESC') & @comments }
      @comments_uniq_by_user = comments_by_user.map {|c_array| c_array.first}.uniq
    end
    if logged_in?
      prepare_ratings(@promoter)
      @comment_fbshare =@promoter.ratings.where(user: current_user).valid_only.last.comment.body if @promoter.ratings && @promoter.ratings.where(user: current_user).valid_only.last && @promoter.ratings.where(user: current_user).valid_only.last.comment
    else
      @new_rating = Rating.first
    end
    render 'venues/show'
  end
end
