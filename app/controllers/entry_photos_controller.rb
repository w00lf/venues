class EntryPhotosController < ApplicationController
  def create
    @entry_photo = EntryPhoto.new(params[:entry_photo])

    respond_to do |format|
      if @entry_photo.save
        format.html { redirect_to :back, notice: 'Event was successfully created.' }
        format.json { render json: @entry_photo }
        format.js
      else
        format.html { redirect_to :back }
        format.json { render json: @entry_photo.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end
end