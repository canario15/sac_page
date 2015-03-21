class CreateTableCategoriesPilots < ActiveRecord::Migration
  def change
    create_table :categories_pilots do |t|
    	t.belongs_to :category
      t.belongs_to :pilot
    end
  end
end
