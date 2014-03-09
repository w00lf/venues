class EntryPhotosController < ApplicationController
  def create
  	@entry = Venue.find(params[:venue_id]) unless params[:venue_id].blank?
  	@entry = Event.find(params[:event_id]) unless params[:event_id].blank?
    @entry_photo = @entry.entry_photos.new(params[:entry_photo])

    respond_to do |format|
      if @entry_photo.save
        format.html { redirect_to :back, notice: 'Event was successfully created.' }
      else
        format.html { redirect_to :back }
      end
    end
  end
end