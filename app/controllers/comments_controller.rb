class CommentsController < ApplicationController  

  def update

    @comment = Comment.find(params[:id])

    @rating = @comment.rating
    @dj = @rating.dj
    @comment.update(comment_params)
  
    if Comment.where(id: params[:id]).any?

      redirect_to dj_path(@dj.slugify)

    else #@comment.body.size < 40#@rating.score && @rating.score > 0 || !@comment.body.blank?
      @rating.destroy
      flash[:warning] = 'You need to give both a rating and a comment (of more than 40 characters) to leave feedback'
      redirect_to dj_path(@dj.slugify)
      # respond_to do |format|
      #   format.js
      # end
    # else
    #   redirect_to dj_path(@dj.slugify)
    end

  end

  private
 
    def comment_params
      params.require(:comment).permit!
    end

end