class PromotersController < ApplicationController

  def index
    @promoters = Promoter.order('rated_at DESC')
  end

  def show
    @promoter = Promoter.find_by(slug: params[:slug])
    @comments = @promoter.comments.select {|c| c.is_valid? && c.valid? && c.rating.valid? && c.rating.score != 0}
    @comments = nil unless @comments.any?
    @image = @promoter.events.where.not(photo_file_name: nil).last.photo.url if @promoter.events.where.not(photo_file_name: nil).any?
    @image ||= @promoter.imageify
    if @comments
      @users = @comments.map {|comment| comment.user}
      comments_by_user = @users.map {|user| user.comments & @comments }
      @comments_uniq_by_user = comments_by_user.map {|c_array| c_array.last}.uniq
    end
    if logged_in?
      prepare_ratings(@promoter)
      @comment_fbshare =@promoter.ratings.where(user: current_user).valid_only.last.comment.body if @promoter.ratings && @promoter.ratings.where(user: current_user).valid_only.last && @promoter.ratings.where(user: current_user).valid_only.last.comment
    else
      @new_rating = Rating.first
    end
  end
end
