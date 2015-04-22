class CommentsController < ApplicationController  
    skip_before_action :authorize

  def update

    @comment = Comment.find(params[:id])
    @rating = @comment.rating
    @comment.update(comment_params)
    @venue = Venue.find(params[:venue_id].to_i) if params[:venue_id]
    @promoter = Promoter.find(params[:promoter_id].to_i) if params[:promoter_id]
    # @event = @comment.event
    # @venue=@event.venue

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
      @event = @rating.event
      @event.update(date: date) if @event
      @event ||= Event.create(venue: @venue, date: date) if @venue
      @event ||= Event.create(promoter: @promoter, date: date) if @promoter
      @rating.update(event: @event)
      flash[:success]="You can edit your comment by hitting the review button again."
      AdminNotification.new_review(current_user, @venue).deliver if current_user.id != 15 && @venue
      AdminNotification.new_review(current_user, @promoter).deliver if current_user.id != 15 && @promoter
      redirect_to venue_path(@venue.slugify) if @venue
      redirect_to promoter_path(@promoter.slugify) if @promoter
    else 
      @rating.update(score: 0)
      flash[:warning] = 'You need to give a rating and a comment (of more than 40 characters) and choose a date to leave feedback'
      redirect_to dj_path(@dj.slugify) if @dj
      redirect_to venue_path(@venue.slugify) if @venue
      redirect_to promoter_path(@promoter.slugify) if @promoter
    end

  end

  private
 
    def comment_params
      params.require(:comment).permit(:body)
    end

end