class EventsController < ApplicationController

  def claim_event
    @event = Event.find(params[:event])
    @user = User.find(params[:current_user])
    if @user.dj_status
      @dj=Dj.find_by(sdcl_id: @user.sdcl_id)
      @event.update(dj_id: @dj.id)
      redirect_to dj_path(@dj.slugify)
    else
      flash[:warning] = 'You need to be a registered DJ to claim an event - please click "DJ Sign Up" above to claim the event.'
      redirect_to :back
    end
  end


end