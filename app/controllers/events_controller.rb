class EventsController < ApplicationController
  before_filter :find_venue

  # GET /events
  # GET /events.json
  def index
    @events = @venue.events.paginate(page: params[:page], per_page: params[:per_page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = @venue.events.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = @venue.events.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = @venue.events.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = @venue.events.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to @venue, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = @venue.events.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = @venue.events.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to venue_path(@venue) }
      format.json { head :no_content }
    end
  end

  private
  def find_venue
    @venue = Venue.find(params[:venue_id])
  end
end
