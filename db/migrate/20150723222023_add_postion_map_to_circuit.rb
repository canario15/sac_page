class AddPostionMapToCircuit < ActiveRecord::Migration
  def change
    add_column :circuits, :map_position, :string
  end
end
