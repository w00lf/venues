class EventTypesController < ApplicationController
  before_filter :authenticate_user!

  def create
    @event_type = EventType.new(params[:event_type])
    if @event_type.save
      respond_to do |format|
        format.html { redirect_to :back }
        format.json { render json: @event_type }
      end
    end
  end
end
