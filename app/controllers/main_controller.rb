class MainController < ApplicationController
	def index
		if params[:events]
			@entries = Event.popular.limit(12)
		else
			@entries = Venue.popular.limit(12)
		end
	end
end
