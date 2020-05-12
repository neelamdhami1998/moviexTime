class Movie < ApplicationRecord
	belongs_to :theater	
	has_many :pictures ,dependent: :destroy
	has_many :timings
	has_many :transactions
	accepts_nested_attributes_for :timings,:allow_destroy => true
	accepts_nested_attributes_for :pictures,:allow_destroy => true
end
