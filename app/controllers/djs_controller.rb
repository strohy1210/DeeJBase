class DjsController < ApplicationController
  skip_before_action :authorize
  def index
    if params[:term]
      @djs = Dj.is_dj.where('lower(name) LIKE ?', "%#{params[:term].downcase}%")
    elsif params[:filter]
      set_params
    else
      @djs = Dj.is_dj.order('rated_at DESC').paginate(page: params[:page], per_page: 10)
    end
    @resources = @djs
    respond_to do |format|  
      format.html { render 'venues/index' }
# Here is where you can specify how to handle the request for "/djs.json"
      format.json { render :json => @djs.map(&:name) }
    end

  end
 

  def update

    DjGenre.where(dj_id: params[:id]).destroy_all
    @dj = Dj.find(params[:id])
    @dj.genres = params["genres"].map {|g| Genre.find(g["id"])}  
    if @dj.update(dj_params)
      flash[:success] = 'Your profile is updated!'
      redirect_to dj_path(@dj.slugify)
    else
      redirect_to :back
      flash[:warning] = "Something went wrong. Sorry, bud."
    end
  end

  def show

    if params[:genre_id]
      set_params
      render 'welcome/index'
    end
    @dj= Dj.find_by(slug: params[:slug])
    @genres = @dj.genres if @dj
    @tracks = @dj.tracks.where.not(demo: nil)
    @comments = @dj.comments.select {|c| c.is_valid? && c.valid? && c.rating.valid? && c.rating.score != 0}
    @comments = nil unless @comments.any?

    # if logged_in?

    #   # @event = Event.where(dj_id: @dj.id).first || @event = Event.create(venue_id: @dj.id)
    #   # @rating = @event.ratings.where(user_id: current_user.id).first if @event.ratings.where(user_id: current_user.id).any?
    #   # @rating ||= Rating.create(event_id: @event.id, user_id: current_user.id, score: 0)
    #   # @comment = Comment.where(rating_id: @rating.id).first
    #   # @comment ||= Comment.create(rating_id: @rating.id)
  
    # else
      @rating = Rating.first
    # end
  end

  def send_contact_email  
    @email = params[:current_user][:email]
    @message = params[:dj][:message]
    phone = params[:current_user][:phone]
    @message << ". * The sender's phone is "+phone
    @dj = Dj.find(params[:dj][:id])
    name = @dj.name
    if current_user
      @sender = current_user
      @sender.update(current_user_params)
    else
      ContactDjMailer.contact_dj(@dj, @message, @email).deliver
    end
    flash[:success] = 'Message sent to '+name+'.'
    redirect_to :back
  end

  private
 
    def dj_params
      params.require(:dj).permit!
    end

    def current_user_params
      params.require(:current_user).permit!
    end
end

