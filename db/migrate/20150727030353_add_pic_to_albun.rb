class AddPicToAlbun < ActiveRecord::Migration
  def change
    add_attachment :albuns, :front_pic
  end
end
