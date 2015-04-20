class PromotersController < ApplicationController
  def index
    @promoters = Promoter.all
  end

  def show
  end
end
