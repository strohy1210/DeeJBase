class SearchesController < ApplicationController
  skip_before_action :authorize
  def index
    if params[:name]
      name = params[:name].strip
      @djs = Dj.is_dj.where('lower(name) LIKE ?', "%#{name.downcase}%").paginate(page: params[:page], per_page: 6).order('updated_at DESC') || Dj.is_dj.where('lower(name) LIKE ?', "%#{name.titleize.downcase}%").paginate(page: params[:page], per_page: 6).order('updated_at DESC')
      if @djs.size == 0
        flash[:warning] = 'Sorry, no one by that name... so here\'s everyone.'
        redirect_to root_path
      elsif @djs.size == 1
        @dj = @djs.first
        redirect_to dj_path(@dj.slugify)
      else
        flash.now[:success] = @djs.size.to_s + ' result(s) for "' +name+'." Click for more info.'
        render 'welcome/index'
      end
    elsif params[:genre_id]
      @genre= Genre.find(params[:genre_id])
      @djs = @genre.djs.is_dj.paginate(page: params[:page], per_page: 6).order('created_at DESC')
      render 'welcome/index'
    else
      @djs = Dj.where.is_dj.paginate(page: params[:page], per_page: 6).order('created_at DESC')
      render 'welcome/index'
    end
  end
end
