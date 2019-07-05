class AddTruckAndCategoryToCircuit < ActiveRecord::Migration[5.1]
  def change
    add_column :circuits, :category_id, :integer
    add_attachment :circuits, :truck
  end
end
