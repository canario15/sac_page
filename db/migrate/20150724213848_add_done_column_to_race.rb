class AddDoneColumnToRace < ActiveRecord::Migration
  def change
    add_column :races, :done, :boolean
  end
end
