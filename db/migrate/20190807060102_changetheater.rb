class Changetheater < ActiveRecord::Migration[5.2]
  def change

  	rename_column :theaters, :price, :merchant_id
  	rename_column :theaters, :theater_id, :movie_id
  end
end
