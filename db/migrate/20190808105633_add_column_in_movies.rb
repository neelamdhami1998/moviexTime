class AddColumnInMovies < ActiveRecord::Migration[5.2]
  def change
  		add_column :movies , :ststus,:boolean
  		add_column :movies , :start_date,:datetime
  		add_column :movies , :end_date , :datetime
  		remove_column :movies , :image , :datetime

  end
end
