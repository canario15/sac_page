class CreateSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :steps do |t|
      t.belongs_to :race, index: true
      t.integer :number
      t.string :name
    end
  end
end
