class CreateRaceResults < ActiveRecord::Migration[5.1]
  def change
    create_table :race_results do |t|
      t.belongs_to :pilot_race, index: true
      t.belongs_to :race, index: true
      t.integer :score
    end
  end
end
