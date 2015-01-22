class CommentsController < ApplicationController  

  def update

    @comment = Comment.find(params[:id])
    @rating = @comment.rating
    @dj = @rating.dj
    @venue = @rating.venue 
    @comment.update(comment_params)

    if @comment.is_valid? && @rating.save && @rating.score > 0 && params[:date] != "Pick a Date"
      if @venue
        array = params[:date].split("-")
        m=array.first
        d=array.second
        y=array.last
        date_formated = d+"-"+m+"-"+y
        date= date_formated.to_date
        @event = Event.find_by(date: date, venue_id: @venue.id) || @event=Event.create(date: date, venue_id: @venue.id)
        @rating.update(event_id: @event.id)
        redirect_to venue_path(@venue)
      else

      redirect_to dj_path(@dj.slugify) if @dj
      end
    else 
      # @rating.destroy
      flash[:warning] = 'You need to give a rating and a comment (of more than 30 characters) and choose a date to leave feedback'
      redirect_to dj_path(@dj.slugify) if @dj
      redirect_to venue_path(@venue) if @venue
    end

  end

  private
 
    def comment_params
      params.require(:comment).permit!
    end

end