class AddCategoryIdColumnToPilotRace < ActiveRecord::Migration[5.1]
  def change
    add_column :pilot_races, :category_id, :integer
  end
end
