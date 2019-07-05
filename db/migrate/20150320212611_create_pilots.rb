class CreatePilots < ActiveRecord::Migration[5.1]
  def change
    create_table :pilots do |t|
      t.integer :number
      t.string :full_name
      t.string :team

      t.timestamps
    end
  end
end
