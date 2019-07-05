class AddSubCategoryToChampionship < ActiveRecord::Migration[5.1]
  def change
    add_column :championships, :sub_category, :string
  end
end
