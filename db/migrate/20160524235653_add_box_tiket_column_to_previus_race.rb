class AddBoxTiketColumnToPreviusRace < ActiveRecord::Migration
  def change
    add_column :race_previus, :box_ticket, :integer
  end
end
