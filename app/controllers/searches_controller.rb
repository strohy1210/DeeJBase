class SearchesController < ApplicationController
  skip_before_action :authorize
  def index
    if params[:name]
      name = params[:name]
      @djs = Dj.where('lower(name) LIKE ?', "%#{name.downcase}%").where(dj_status: true).paginate(page: params[:page], per_page: 6).order('created_at DESC')
      if @djs.size == 0
        flash[:warning] = 'Sorry, no one by that name... so here\'s everyone.'
        redirect_to root_path
      else
        flash.now[:success] = @djs.size.to_s + ' result(s) for "' +name+'" Click on a DJ for more info.'
        render 'welcome/index'
      end
    elsif params[:genre_id]
      @genre= Genre.find(params[:genre_id])
      @djs = @genre.djs.where(dj_status: true, agent_status: false).paginate(page: params[:page], per_page: 6).order('created_at DESC')
      render 'welcome/index'
    else
      @djs = Dj.where(dj_status: true, agent_status: false).paginate(page: params[:page], per_page: 6).order('created_at DESC')
      render 'welcome/index'
    end
  end
end
