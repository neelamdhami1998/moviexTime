class PicturesController < ApplicationController
	before_action :authenticate_marchant!
	def new
		@movie = Movie.find(params[:movie_id])
		@picture = Picture.new
		@pictures = @movie.pictures 
	end
	def create
		@movie = Movie.find(params[:movie_id])
		@picture = 	@movie.pictures.create(picture_params)
		@picture.save
		redirect_to new_movie_picture_path
	end
	def show
		@pic_delete = Picture.find(params[:id])
		@pic_delete.destroy
		redirect_to movie_info_path
	end
	private
	def picture_params
		params.require(:picture).permit(:image )
	end
end

