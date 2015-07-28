class AddShortNameColumnToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :short_name, :string
  end
end
