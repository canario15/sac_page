class AddLogoToCircuit < ActiveRecord::Migration[5.1]
  def up
    add_attachment :circuits, :logo
  end

  def down
    remove_attachment :circuits, :logo
  end
end

