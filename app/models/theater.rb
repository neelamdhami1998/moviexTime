class Theater < ApplicationRecord
	belongs_to :marchant
	has_many :movies, dependent: :destroy
	has_many :transactions
	def fetch_time movie
		self.movies.find_by(name: movie.name).timings
	end
end
