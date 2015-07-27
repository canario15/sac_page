class AddCircuitIdColumnToRace < ActiveRecord::Migration
  def change
    add_column :races, :circuit_id, :integer
  end
end
