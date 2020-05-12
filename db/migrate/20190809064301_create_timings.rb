class CreateTimings < ActiveRecord::Migration[5.2]
  def change
    create_table :timings do |t|
      t.datetime :start_time
      t.integer :movies_id

      t.timestamps
    end
  end
end
