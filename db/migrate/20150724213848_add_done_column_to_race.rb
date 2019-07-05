class AddDoneColumnToRace < ActiveRecord::Migration[5.1]
  def change
    add_column :races, :done, :boolean
  end
end
