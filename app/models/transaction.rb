class Transaction < ApplicationRecord
	belongs_to :user
	belongs_to :movie
	belongs_to :theater
	belongs_to :timing
end
