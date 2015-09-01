class AddVideoUrlColumnToCircuit < ActiveRecord::Migration
  def change
    add_column :circuits, :video_url, :string
  end
end
