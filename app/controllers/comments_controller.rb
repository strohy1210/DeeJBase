class CommentsController < ApplicationController  

  def update

    @comment = Comment.find(params[:id])
    @rating = @comment.rating
    @dj = @rating.dj
    @venue = @rating.venue
    @comment.update(comment_params)
    if @comment.is_valid? && @rating.valid? && @rating.score > 0 #&& Comment.where(id: params[:id]).any?

      redirect_to dj_path(@dj.slugify) if @dj
      redirect_to venue_path(@venue) if @venue
    else 
      # @rating.destroy
      flash[:warning] = 'You need to give both a rating and a comment (of more than 30 characters) to leave feedback'
      redirect_to dj_path(@dj.slugify) if @dj
      redirect_to venue_path(@venue) if @venue
    end

  end

  private
 
    def comment_params
      params.require(:comment).permit!
    end

end