class SearchesController < ApplicationController
  skip_before_action :authorize
  def index
    if params[:name]
      name = params[:name].strip
      @dj_results= Dj.is_dj.where('lower(name) LIKE ?', "%#{name.downcase}%") || Dj.is_dj.where('lower(name) LIKE ?', "%#{name.titleize.downcase}%")
      @djs = Dj.is_dj.where('lower(name) LIKE ?', "%#{name.downcase}%").paginate(page: params[:page], per_page: 36).order('updated_at DESC') || Dj.is_dj.where('lower(name) LIKE ?', "%#{name.titleize.downcase}%").paginate(page: params[:page], per_page: 36).order('updated_at DESC')
      if @djs.size == 0
        link = ActionController::Base.helpers.link_to('here', root_path)
        flash[:warning] = 'Sorry, no one by that name... so here\'s everyone. Search venues ' + link + '.'
        redirect_to djs_path
      elsif @djs.size == 1
        @dj = @djs.first
        redirect_to dj_path(@dj.slugify)
      else
        flash.now[:success] = @dj_results.size.to_s + ' result(s) for "' +name+'." Click for more info.'
        @resources = @djs
        render 'venues/index', layout: "application"
      end
    elsif params[:genre_id]
      @genre= Genre.find(params[:genre_id])
      @djs = @genre.djs.is_dj.paginate(page: params[:page], per_page: 36).order('created_at DESC')
      @resources = @djs
      render 'venues/index', layout: "application"
    else
      @djs = Dj.where.is_dj.paginate(page: params[:page], per_page: 36).order('created_at DESC')
      @resources = @djs
      render 'venues/index', layout: "application"
    end
  end

  def venue_index
    if params[:name]
      name = params[:name].strip
      @venue_results = Venue.where('lower(name) LIKE ?', "%#{name.downcase}%").order('name ASC') || Venue.where('lower(name) LIKE ?', "%#{name.titleize.downcase}%").order('name ASC')
      if @venue_results.size == 0
        link = ActionController::Base.helpers.link_to('here', promoters_path)
        flash[:warning] = "Sorry, no places by that name... so here\'s em all. Or search promoters " + link + "."
        redirect_to venues_path
      elsif @venue_results.size == 1
        @venue = @venue_results.first
        redirect_to venue_path(@venue.slugify)
      else
        @venues = Venue.where('lower(name) LIKE ?', "%#{name.downcase}%").paginate(page: params[:page], per_page: 45).order('name ASC') || Venue.where('lower(name) LIKE ?', "%#{name.titleize.downcase}%").paginate(page: params[:page], per_page: 45).order('name ASC')
        flash.now[:success] = @venue_results.size.to_s + ' venue(s) matching "' +name+'". Click for more info.'
        @resources = @venues
        render 'venues/index', layout: "promoters"
      end
    else
     redirect_to venues_path
    end
  end

  def promoter_index
    if params[:name]
      name = params[:name].strip
      @promoter_results = Promoter.where('lower(name) LIKE ?', "%#{name.downcase}%").order('name ASC') || Promoter.where('lower(name) LIKE ?', "%#{name.titleize.downcase}%").order('name ASC')
      if @promoter_results.size == 0
        link = ActionController::Base.helpers.link_to('here', venues_path)
        flash[:warning] = "Sorry, no parties by that name... so here\'s em all. Or search venues " + link + "."
        redirect_to promoters_path
      elsif @promoter_results.size == 1
        @promoter = @promoter_results.first
        redirect_to promoter_path(@promoter.slugify)
      else
        @promoters = Promoter.where('lower(name) LIKE ?', "%#{name.downcase}%").paginate(page: params[:page], per_page: 45).order('name ASC') || Promoter.where('lower(name) LIKE ?', "%#{name.titleize.downcase}%").paginate(page: params[:page], per_page: 45).order('name ASC')
        flash.now[:success] = @promoter_results.size.to_s + ' promoter(s) matching "' +name+'". Click for more info.'
        @resources = @promoters
        render 'venues/index', layout: "promoters"
      end
    else
     redirect_to promoters_path
    end
  end

end
