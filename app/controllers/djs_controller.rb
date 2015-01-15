class DjsController < ApplicationController
  skip_before_action :authorize
  def index
    @djs = Dj.is_dj.paginate(page: params[:page], per_page: 6).order('updated_at DESC')
    render 'welcome/index'
  end
 

  def update

    DjGenre.where(dj_id: params[:id]).destroy_all
    @dj = Dj.find(params[:id])
    @dj.genres = params["genres"].map {|g| Genre.find(g["id"])}

    @dj.update(dj_params)
    if @dj.save
      flash[:success] = 'Your profile is updated!'
      redirect_to dj_path(@dj.slugify)
    else
      render 'new'
    end
  end

  def show

    if params[:genre_id]
      set_params
      render 'welcome/index'
    end
    @dj= Dj.find_by(slug: params[:name])
    @genres = @dj.genres
    @tracks = @dj.tracks.where.not(demo: nil)
    if @dj.comments.where.not(body: nil).any?
      @comments = @dj.comments.where.not(body: nil)
    end

    if logged_in?

      @rating = Rating.where(dj_id: @dj.id, user_id: current_user.id).first
      @rating ||= Rating.create(dj_id: @dj.id, user_id: current_user.id, score: 0)
      @comment = Comment.where(rating_id: @rating.id).first
      @comment ||= Comment.create(rating_id: @rating.id)
  
    else
      @rating = Rating.first
    end
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

