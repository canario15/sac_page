class ChangeColumnNamePilotStep < ActiveRecord::Migration[5.1]
  def change
  	rename_column :pilot_steps, :pilot_id, :pilot_race_id
  end
end
