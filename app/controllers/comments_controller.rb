class CommentsController < ApplicationController  

  def update

    @comment = Comment.find(params[:id])
    @rating = @comment.rating
    @dj = @rating.dj
    @comment.update(comment_params)
    if @comment.is_valid? && @rating.valid? && @rating.score > 0 #&& Comment.where(id: params[:id]).any?

      redirect_to dj_path(@dj.slugify)

    else 
      # @rating.destroy
      flash[:warning] = 'You need to give both a rating and a comment (of more than 40 characters) to leave feedback'
      redirect_to dj_path(@dj.slugify)
    end

  end

  private
 
    def comment_params
      params.require(:comment).permit!
    end

end