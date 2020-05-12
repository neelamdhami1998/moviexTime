class ChangeStstusColumnInMovies < ActiveRecord::Migration[5.2]
  def change
  	rename_column :movies ,:ststus,:status
  end
end
