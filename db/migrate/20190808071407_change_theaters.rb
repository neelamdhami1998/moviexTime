class ChangeTheaters < ActiveRecord::Migration[5.2]
  def change
  	rename_column :theaters, :description, :address
  	remove_column :theaters, :image, :string
  	add_column :theaters, :contact_no, :string
  end
end
