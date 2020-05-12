class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.integer :theater_id
      t.integer :movie_id
      t.integer :timing_id
      t.integer :quantity
      t.integer :total_amount

      t.timestamps
    end
  end
end
