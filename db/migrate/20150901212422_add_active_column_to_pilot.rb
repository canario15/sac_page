class AddActiveColumnToPilot < ActiveRecord::Migration
  def change
    add_column :pilots, :active, :boolean
  end
end
