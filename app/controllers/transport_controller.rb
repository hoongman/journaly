class TransportController < ApplicationController

	def show
		@my_trip = params[:id]
		@trip = Trip.find(params[:id])
		@places = @trip.places
		@start = @trip.places.where(:previous_place_id => nil)

		@connected_places = []
		@start.each {|place| @connected_places << place.to_h}


	end

end