class Addtotransactions < ActiveRecord::Migration[5.2]
  def change
  	add_column :transactions, :status, :string ,default: "pending"
  	add_column :users, :phone_no, :integer
  end
end
