class AddPhotoToPreviusRace < ActiveRecord::Migration
  def change
    add_attachment :race_previus, :picture
  end
end
