class RemoveNumberColumToPilot < ActiveRecord::Migration
  def change
  	remove_column :pilots, :number
  end
end
