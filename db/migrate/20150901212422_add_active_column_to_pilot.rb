class AddActiveColumnToPilot < ActiveRecord::Migration[5.1]
  def change
    add_column :pilots, :active, :boolean
  end
end
