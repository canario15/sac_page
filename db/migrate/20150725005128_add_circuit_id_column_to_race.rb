class AddCircuitIdColumnToRace < ActiveRecord::Migration[5.1]
  def change
    add_column :races, :circuit_id, :integer
  end
end
