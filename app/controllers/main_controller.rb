class MainController < ApplicationController
	def index
		@venues = Event.popular.limit(9)
		@events = Venue.visible.popular.limit(9)
	end
end
