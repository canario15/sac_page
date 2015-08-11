class CreateRacePrevius < ActiveRecord::Migration
  def change
    create_table :race_previus do |t|
      t.integer :race_id
      t.integer :ticket
      t.text :crono
    end
  end
end
