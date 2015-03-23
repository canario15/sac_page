class ChangeColumnNamePilotStep < ActiveRecord::Migration
  def change
  	rename_column :pilot_steps, :pilot_id, :pilot_race_id
  end
end
