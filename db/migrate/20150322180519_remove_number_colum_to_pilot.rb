class RemoveNumberColumToPilot < ActiveRecord::Migration[5.1]
  def change
  	remove_column :pilots, :number
  end
end
