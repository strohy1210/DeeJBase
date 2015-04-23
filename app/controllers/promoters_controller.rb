class PromotersController < ApplicationController
  layout "venues"
  def index
    @promoters = Promoter.all
  end

  def show
    @promoter = Promoter.find_by(slug: params[:slug])
    @comments = @promoter.comments.select {|c| c.is_valid? && c.valid? && c.rating.valid? && c.rating.score != 0}
    @comments = nil unless @comments.any?
    if @comments
      @users = @comments.map {|comment| comment.user}
      comments_by_user = @users.map {|user| user.comments & @comments }
      @comments_uniq_by_user = comments_by_user.map {|c_array| c_array.last}.uniq
    end

    if logged_in?
      @events = @promoter.events
      if @events
        @events.each do |event|
          @rating = event.ratings.find_by(user: current_user) if event.ratings
        end
      end
      # @event = current_user.events.where(promoter_id: @promoter.id).first if current_user.events.any? && current_user.events.where(promoter_id: @promoter.id)
      # @event ||= Event.create(promoter_id: @promoter.id)
      # current_user.events << @event unless current_user.events.include? @event
      # @rating = current_user.ratings @event.ratings.where(user_id: current_user.id).first if @event.ratings.where(user_id: current_user.id).any?
      @rating ||= Rating.create(user_id: current_user.id, score: 0)
      @comment = Comment.find_by(rating_id: @rating.id)
      @comment ||= Comment.create(rating_id: @rating.id)

    else
      @rating = Rating.first
    end
  end
end
