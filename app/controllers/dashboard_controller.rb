class DashboardController < ApplicationController
   def index
    	@movies = Movie.all.to_a.uniq { |item| item.name }
    end
end
