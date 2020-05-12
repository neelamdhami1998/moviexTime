class MarchantUsersController < ApplicationController
	before_action :authenticate_marchant!
	def index
		@theaters = current_marchant.theaters
	end
end
