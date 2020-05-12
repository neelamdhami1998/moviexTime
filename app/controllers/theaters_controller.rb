class TheatersController < ApplicationController
	before_action :authenticate_marchant!
	def new
		@theater = current_marchant.theaters.new
	end
	def create		
		@theater = current_marchant.theaters.new(theaters_params)
 		@theater.save
  		redirect_to marchant_users_path
	end
	def show
		@theater = current_marchant.theaters.find(params[:id])
	end
	def edit
		@theater_edit = current_marchant.theaters.find(params[:id])
	end
	def update 		
 		@theater_u = current_marchant.theaters.find(params[:id])
  		if @theater_u.update(theaters_params)
   			 redirect_to marchant_users_path
 		 else
    		render 'edit'
  		end
	end
	def index
		@theaters =  current_marchant.theaters
	end
private
	def theaters_params
 	 params.require(:theater).permit(:name, :contact_no, :address)
	end
end
