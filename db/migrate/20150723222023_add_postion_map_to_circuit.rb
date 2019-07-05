class AddPostionMapToCircuit < ActiveRecord::Migration[5.1]
  def change
    add_column :circuits, :map_position, :string
  end
end
