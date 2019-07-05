class CreateCircuits < ActiveRecord::Migration[5.1]
  def change
    create_table :circuits do |t|
      t.string :name
      t.string :location
      t.text :description
      t.string :large


      t.timestamps
    end
  end
end
