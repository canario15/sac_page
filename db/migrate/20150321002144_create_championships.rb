class CreateChampionships < ActiveRecord::Migration[5.1]
  def change
    create_table :championships do |t|
      t.string :name
      t.integer :year
      t.integer :one_id
      t.integer :two_id
      t.integer :three_id
      t.belongs_to :category

      t.timestamps
    end
  end
end
