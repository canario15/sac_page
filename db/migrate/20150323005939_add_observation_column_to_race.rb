class AddObservationColumnToRace < ActiveRecord::Migration
  def change
    add_column :races, :observation, :text
  end
end
