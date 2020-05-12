class MoviesController < ApplicationController
	before_action :authenticate_user!, only: [:book_now]
  	def index
 	 	@movies = Movie.all
	end
	def new
		@theater = Theater.find(params[:theater_id])
		@movie = @theater.movies.build
	end
	def show		
		@movie = Movie.find_by(id: params[:id])		
		@theaters = Theater.joins(:movies).where('movies.name LIKE ?', @movie.name).uniq
	end
	def create
		@theater = Theater.find(params[:theater_id])
		@movie = @theater.movies.new(movies_params)
		@movie.name = @movie.name.downcase.strip
 		@movie.save
  		redirect_to theater_path(@theater)
	end
	def edit
		@theater = Theater.find(params[:theater_id])
		@movie = Movie.find(params[:id])
	end
	def update
		@theater = Theater.find(params[:theater_id])
		@movies = Movie.find(params[:id])
		if @movies.update(movies_params)
     		redirect_to theater_path(@theater)
     	else
     		render 'edit'
     	end
  	end
 	def book_now
  		 @movie = Movie.find(params[:movie_id])
 		 @theater = Theater.find(params[:theater_id])
  		 @timing = Timing.last
  		 @transaction = Transaction.new
 	end
  	def info
  		@movie = Movie.find_by(id: params[:movie_id])
  	end
private
	def movies_params
 	 	params.require(:movie).permit( :name, :description, :price, :start_date,:end_date, :status,
 	 								timings_attributes: [:id,:start_time,:_destroy],
 	 								pictures_attributes: [:id,:image,:_destroy]) 	 
	end
end
