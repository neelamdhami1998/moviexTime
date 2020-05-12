class ChangeMerchantInThearter < ActiveRecord::Migration[5.2]
  def change
  	rename_column :theaters ,:merchant_id,:marchant_id
  	remove_column :theaters, :movie_id,:integer
  end
end
