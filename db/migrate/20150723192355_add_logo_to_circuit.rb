class AddLogoToCircuit < ActiveRecord::Migration
  def up
    add_attachment :circuits, :logo
  end

  def down
    remove_attachment :circuits, :logo
  end
end

