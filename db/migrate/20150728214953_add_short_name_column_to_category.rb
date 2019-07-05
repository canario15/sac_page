class AddShortNameColumnToCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :short_name, :string
  end
end
