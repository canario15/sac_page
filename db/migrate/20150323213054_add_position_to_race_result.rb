class AddPositionToRaceResult < ActiveRecord::Migration[5.1]
  def change
    add_column :race_results, :position, :integer
  end
end
