class CreateTableCategoriesPilots < ActiveRecord::Migration[5.1]
  def change
    create_table :categories_pilots do |t|
    	t.belongs_to :category
      t.belongs_to :pilot
    end
  end
end
