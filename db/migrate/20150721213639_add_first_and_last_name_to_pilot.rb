class AddFirstAndLastNameToPilot < ActiveRecord::Migration[5.1]
  def change
    add_column :pilots, :first_name, :string
    add_column :pilots, :last_name, :string
  end
end
