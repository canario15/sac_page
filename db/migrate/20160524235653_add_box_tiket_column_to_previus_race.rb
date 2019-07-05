class AddBoxTiketColumnToPreviusRace < ActiveRecord::Migration[5.1]
  def change
    add_column :race_previus, :box_ticket, :integer
  end
end
