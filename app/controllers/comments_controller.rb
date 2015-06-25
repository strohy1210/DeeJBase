class CommentsController < ApplicationController  
    skip_before_action :authorize

  def update
    @comment = Comment.find(params[:id])
    photo= params[:photo] if !params[:photo].blank?
    @rating = @comment.rating
    @comment.update(comment_params)
    @venue = Venue.find(params[:venue_id].to_i) if params[:venue_id]
    @promoter = Promoter.find(params[:promoter_id].to_i) if params[:promoter_id]
    @festival = Festival.find(params[:festival_id].to_i) if params[:festival_id]
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
      @event.date = date if @event && date
      @event ||= Event.new(venue: @venue, date: date) if @venue
      @event ||= Event.new(promoter: @promoter, date: date) if @promoter
      @event ||= Event.new(festival: @festival, date: date) if @festival
      @event.photo = photo if photo
      @event.dj = @dj if @dj
      if @event.save
        @rating.update(event: @event)
        AdminNotification.new_review(current_user, @venue).deliver if  @venue && current_user.id != 15 && current_user.id !=7
        AdminNotification.new_review(current_user, @promoter).deliver if @promoter && current_user.id != 15 && current_user.id !=7
        AdminNotification.new_review(current_user, @festival).deliver if  @festival && current_user.id != 15 && current_user.id !=7
        redirect_to venue_path(@venue.slugify) if @venue
        redirect_to promoter_path(@promoter.slugify) if @promoter
        redirect_to festival_path(@festival.slugify) if @festival
      else
        @rating.destroy
        flash[:warning] = 'You need to give a rating and a comment (of more than 40 characters) and choose a date to leave feedback'
        redirect_to venue_path(@venue.slugify) if @venue
        redirect_to promoter_path(@promoter.slugify) if @promoter
        redirect_to festival_path(@festival.slugify) if @festival
      end
    else 
      @rating.destroy
      flash[:warning] = 'You need to give a rating and a comment (of more than 40 characters) and choose a date to leave feedback'
      redirect_to venue_path(@venue.slugify) if @venue
      redirect_to promoter_path(@promoter.slugify) if @promoter
      redirect_to festival_path(@festival.slugify) if @festival
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