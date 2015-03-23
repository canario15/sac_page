class CreatePilotRaces < ActiveRecord::Migration
  def change
    create_table :pilot_races do |t|
      t.belongs_to :pilot, index: true
      t.belongs_to :race, index: true
      t.integer :number

      t.timestamps
    end
  end
end
