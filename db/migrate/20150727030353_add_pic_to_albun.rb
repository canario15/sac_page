class AddPicToAlbun < ActiveRecord::Migration[5.1]
  def change
    add_attachment :albuns, :front_pic
  end
end
