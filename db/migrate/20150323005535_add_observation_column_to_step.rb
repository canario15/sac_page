class AddObservationColumnToStep < ActiveRecord::Migration
  def change
    add_column :steps, :observation, :text
  end
end
