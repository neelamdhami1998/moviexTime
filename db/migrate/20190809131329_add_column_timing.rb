class AddColumnTiming < ActiveRecord::Migration[5.2]
  def change

  	rename_column :timings, :movies_id,:movie_id
  end
end
