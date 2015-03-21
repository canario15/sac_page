class AddCarToPilot < ActiveRecord::Migration
  def change
    add_column :pilots, :car, :string
  end
end
