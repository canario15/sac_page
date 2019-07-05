class AddCityToPilots < ActiveRecord::Migration[5.1]
  def change
    add_column :pilots, :city, :string
  end
end
