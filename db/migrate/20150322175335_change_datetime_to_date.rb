class ChangeDatetimeToDate < ActiveRecord::Migration[5.1]
	def self.up
    change_column :races, :date, :date
  end

  def self.down
    change_column :races, :date, :date_time
  end
end
