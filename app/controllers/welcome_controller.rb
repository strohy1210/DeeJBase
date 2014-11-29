class WelcomeController < ApplicationController
   skip_before_action :authorize
  def index
    @djs = Dj.all
  end

end
