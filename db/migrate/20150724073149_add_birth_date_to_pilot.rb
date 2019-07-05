class AddBirthDateToPilot < ActiveRecord::Migration[5.1]
  def change
    add_column :pilots, :birth_date, :date
  end
end
