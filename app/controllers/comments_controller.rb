class CommentsController < ApplicationController  

  def update
    @comment = Comment.find(params[:id])
    @rating = @comment.rating
    if @comment.update(comment_params)
      respond_to do |format|
        format.js
      end
    end
  end

  private
 
    def comment_params
      params.require(:comment).permit!
    end

end