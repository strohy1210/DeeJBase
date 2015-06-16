class Admin::EventsController < ApplicationController
  before_action :verify_admin
  before_action :set_event, only: [:show, :edit, :update]
  layout 'admin'

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.update(owner: current_user.name)
        format.html { redirect_to event_path(@event), notice: 'event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    photo= params[:photo] if !params[:photo].blank?
    respond_to do |format|
      if @event.update(event_params)
        @event.update(photo: photo)
        format.html { redirect_to admin_event_path(@event), notice: 'event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # # DELETE /events/1.json
  # def destroy
  #   @event.destroy
  #   respond_to do |format|
  #     format.html { redirect_to admin_events_url, notice: 'event was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :priority, :number, :num_right, :category, :difficulty_level, :gender, :min_age, :max_age, :smoking, :weight, :link, :is_mma, answers_attributes: [:id, :name, :explanation, :is_right, :_destroy])
    end
end
