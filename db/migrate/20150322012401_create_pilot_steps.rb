class CreatePilotSteps < ActiveRecord::Migration
  def change
    create_table :pilot_steps do |t|
      t.belongs_to :step, index: true
      t.string :time
      t.belongs_to :pilot, index: true
      t.integer :score
      t.integer :position
    end
  end
end
