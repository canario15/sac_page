class AddColumnsToCategory < ActiveRecord::Migration
  def self.up
    change_table :categories do |t|
    	t.text :description
      t.attachment :logo
    end
  end

  def self.down
  	remove_column :categories, :description
    remove_attachment :categories, :logo
  end

end