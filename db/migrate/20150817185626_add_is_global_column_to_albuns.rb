class AddIsGlobalColumnToAlbuns < ActiveRecord::Migration[5.1]
  def change
    add_column :albuns, :is_global, :boolean
  end
end
