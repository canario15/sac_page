class AddTruckAndCategoryToCircuit < ActiveRecord::Migration
  def change
    add_column :circuits, :category_id, :integer
    add_attachment :circuits, :truck
  end
end
