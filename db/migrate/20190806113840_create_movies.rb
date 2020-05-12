class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :image
      t.string :name
      t.string :description
      t.integer :price
      t.integer :theater_id

      t.timestamps
    end
  end
end
