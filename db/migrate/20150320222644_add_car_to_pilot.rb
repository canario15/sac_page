class AddCarToPilot < ActiveRecord::Migration[5.1]
  def change
    add_column :pilots, :car, :string
  end
end
