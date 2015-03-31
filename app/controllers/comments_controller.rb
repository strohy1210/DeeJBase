class CommentsController < ApplicationController  
    skip_before_action :authorize

  def update

    @comment = Comment.find(params[:id])
    @rating = @comment.rating
    @comment.update(comment_params)
    @event = @comment.event
    @venue=@event.venue

    if @comment.is_valid? && @rating.save && @rating.score > 0 && params[:date] != "mm-dd-yyyy" && params[:date] != ""
      array = params[:date].split("-")
      m=array.first
      d=array.second
      y=array.last
      begin
        date_formated = d+"-"+m+"-"+y
        date= date_formated.to_date
      rescue
        date = Date.today
      end 
      @event.update(date: date)
      flash[:success]="You can edit your comment by hitting the review button again."
      AdminNotification.new_review(current_user, @comment.venue).deliver
      redirect_to venue_path(@venue.slugify)
    else 
      @rating.update(score: 0)
      flash[:warning] = 'You need to give a rating and a comment (of more than 40 characters) and choose a date to leave feedback'
      redirect_to dj_path(@dj.slugify) if @dj
      redirect_to venue_path(@venue.slugify) if @venue
    end

  end

  private
 
    def comment_params
      params.require(:comment).permit!
    end

end