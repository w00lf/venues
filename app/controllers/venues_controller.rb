class VenuesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :edit, :update, :create]
  before_filter :set_right_price_format
  # GET /venues
  # GET /venues.json
  def index
    @venues = Venue.paginate(page: params[:page], per_page: params[:per_page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @venues }
    end
  end

  # GET /venues/1
  # GET /venues/1.json
  def show
    # @venue = Venue.visible.find(params[:id])
    @venue = Venue.find(params[:id]) 

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @venue }
    end
  end

  # GET /venues/new
  # GET /venues/new.json
  def new
    clear_uploaded
    @venue = Venue.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @venue }
    end
  end

  # GET /venues/1/edit
  def edit
    clear_uploaded
    @venue = Venue.find(params[:id])
  end

  # POST /venues
  # POST /venues.json
  def create
    params[:venue][:entry_photo_ids] = params[:venue][:entry_photo_ids] & current_user.entry_photo_ids.map(&:to_s)
    @venue = current_user.venues.build(params[:venue])

    respond_to do |format|
      if @venue.save
        format.html { redirect_to venues_path, notice: 'Venue was successfully created.' }
        format.json { render json: @venue, status: :created, location: @venue }
      else
        format.html { render action: "new" }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /venues/1
  # PUT /venues/1.json
  def update
    @venue = Venue.find(params[:id])
    byebug

    respond_to do |format|
      if @venue.update_attributes(params[:venue])
        format.html { redirect_to @venue, notice: 'Venue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /venues/1
  # DELETE /venues/1.json
  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy

    respond_to do |format|
      format.html { redirect_to venues_url }
      format.json { head :no_content }
    end
  end

  private

  def set_right_price_format
    if params[:venue].present?
      params[:venue].each do |indx, val|
        params[:venue][indx] = Venue.change_price_format(val) if indx.to_s.include?('price')
      end
    end
  end

  def clear_uploaded
    current_user.entry_photos.not_linked.destroy_all    
  end
end
