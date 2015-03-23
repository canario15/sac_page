class AddPositionToRaceResult < ActiveRecord::Migration
  def change
    add_column :race_results, :position, :integer
  end
end
