class AddCityToPilots < ActiveRecord::Migration
  def change
    add_column :pilots, :city, :string
  end
end
