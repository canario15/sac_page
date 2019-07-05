class AddPictureColumnToCircuitPicture < ActiveRecord::Migration[5.1]
  def change
    add_attachment :circuit_pictures, :picture
    add_column :circuit_pictures, :circuit_id, :integer
    add_column :circuit_pictures, :name, :string
  end
end
