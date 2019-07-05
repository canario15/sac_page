class AddCarPicToPilot < ActiveRecord::Migration[5.1]
  def change
    add_attachment :pilots, :car_pic
    add_attachment :pilots, :helmet_pic
    add_attachment :pilots, :complete_pic
  end
end
