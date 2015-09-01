class AddPictureColumnToCircuitPicture < ActiveRecord::Migration
  def change
    add_attachment :circuit_pictures, :picture
    add_column :circuit_pictures, :circuit_id, :integer
    add_column :circuit_pictures, :name, :string
  end
end
