class AddCategoryIdColumnToPilotRace < ActiveRecord::Migration
  def change
    add_column :pilot_races, :category_id, :integer
  end
end
