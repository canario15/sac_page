class AddObservationColumnToRace < ActiveRecord::Migration[5.1]
  def change
    add_column :races, :observation, :text
  end
end
