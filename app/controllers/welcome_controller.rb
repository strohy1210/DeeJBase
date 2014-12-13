class WelcomeController < ApplicationController
   skip_before_action :authorize
  def index
    current_user
    @djs = Dj.all
  end

end
