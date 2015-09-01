class AddIsGlobalColumnToAlbuns < ActiveRecord::Migration
  def change
    add_column :albuns, :is_global, :boolean
  end
end
