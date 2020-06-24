class TimingsController < ApplicationController
	def new
		@timing = Timings.all
	end
end
