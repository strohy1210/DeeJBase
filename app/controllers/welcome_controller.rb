class WelcomeController < ApplicationController
  def index
    @djs = Dj.all
  end

end
