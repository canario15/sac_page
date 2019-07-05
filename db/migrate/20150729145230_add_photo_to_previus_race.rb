class AddPhotoToPreviusRace < ActiveRecord::Migration[5.1]
  def change
    add_attachment :race_previus, :picture
  end
end
