class AddVideoUrlColumnToCircuit < ActiveRecord::Migration[5.1]
  def change
    add_column :circuits, :video_url, :string
  end
end
