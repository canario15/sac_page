class CreateAlbuns < ActiveRecord::Migration[5.1]
  def change
    create_table :albuns do |t|
      t.string :name
      t.string :code
      t.date :date_albun
      t.integer :category_id
    end
  end
end
