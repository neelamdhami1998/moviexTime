class CreateTheaters < ActiveRecord::Migration[5.2]
  def change
    create_table :theaters do |t|
      t.string :image
      t.string :name
      t.string :description
      t.integer :price
      t.integer :theater_id

      t.timestamps
    end
  end
end
