class AddSubCategoryToChampionship < ActiveRecord::Migration
  def change
    add_column :championships, :sub_category, :string
  end
end
