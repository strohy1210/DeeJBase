class CommentsController < ApplicationController  
    skip_before_action :authorize

  def update

    @comment = Comment.find(params[:id])
    @rating = @comment.rating
    @comment.update(comment_params)
    @venue = Venue.find(params[:venue_id].to_i) if params[:venue_id]
    @promoter = Promoter.find(params[:promoter_id].to_i) if params[:promoter_id]
    @dj= Dj.find_by(name: params[:dj_name]) if params[:dj_name].size > 1
    @dj||=Dj.create_adhoc_dj(params[:dj_name]) if params[:dj_name].size > 1

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
      @event.update(date: date) if @event && date
      @event ||= Event.new(venue: @venue, date: date) if @venue
      @event ||= Event.new(promoter: @promoter, date: date) if @promoter
      @event.update(dj: @dj) if @dj
      @rating.update(event: @event)
      AdminNotification.new_review(current_user, @venue).deliver if current_user.id != 15 && @venue
      AdminNotification.new_review(current_user, @promoter).deliver if current_user.id != 15 && @promoter
      redirect_to venue_path(@venue.slugify) if @venue
      redirect_to promoter_path(@promoter.slugify) if @promoter
    else 
      @rating.destroy
      flash[:warning] = 'You need to give a rating and a comment (of more than 40 characters) and choose a date to leave feedback'
      redirect_to venue_path(@venue.slugify) if @venue
      redirect_to promoter_path(@promoter.slugify) if @promoter
    end

  end

  def fix_comment
    @comment = Comment.find(params[:comment][:id])
    if params[:comment][:body].length > 40
      @comment.update(comment_params)
      
    else
      @invalid = "Comment did not update (must be above 40 characters)"
      flash[:warning] = "Comment did not update (must be above 40 characters)" 
    end
  end

  private
 
    def comment_params
      params.require(:comment).permit(:body, :id)
    end

end