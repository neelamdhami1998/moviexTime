class Timing < ApplicationRecord
  belongs_to :movie
  has_many :transactions
end