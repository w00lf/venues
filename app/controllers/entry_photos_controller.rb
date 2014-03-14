class EntryPhotosController < ApplicationController
  def create
    @entry_photo = current_user.entry_photos.new(params[:entry_photo])

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

  def destroy
    @entry_photo = current_user.entry_photos.find(params[:id])

    respond_to do |format|
      @entry_photo.destroy
      format.html { redirect_to :back, notice: 'Destroied.' }
      format.json { render json: @entry_photo }
      format.js { render text: 'Ok' }
    end
  end
end