class TimingsController < ApplicationController
	def new
		@timing = Timings.all
	end

	def index
		movie_id = params[:movie]
		theater_id =  params[:theater]
		@movie = Movie.find(movie_id)
		@theater = Theater.find(theater_id)
	end
end
