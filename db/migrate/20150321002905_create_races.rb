class CreateRaces < ActiveRecord::Migration[5.1]
  def change
    create_table :races do |t|
      t.belongs_to :championship, index: true
      t.string :city
      t.datetime :date
      t.string :name

      t.timestamps
    end
  end
end
