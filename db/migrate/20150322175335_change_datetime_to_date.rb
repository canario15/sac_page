class ChangeDatetimeToDate < ActiveRecord::Migration
	def self.up
    change_column :races, :date, :date
  end

  def self.down
    change_column :races, :date, :date_time
  end
end
