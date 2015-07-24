class AddBirthDateToPilot < ActiveRecord::Migration
  def change
    add_column :pilots, :birth_date, :date
  end
end
