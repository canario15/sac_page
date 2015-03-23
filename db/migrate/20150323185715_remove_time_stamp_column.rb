class RemoveTimeStampColumn < ActiveRecord::Migration
  def change
  	remove_column :races, :created_at
  	remove_column :races, :updated_at

  	remove_column :pilots, :created_at
  	remove_column :pilots, :updated_at

  	remove_column :pilot_races, :created_at
  	remove_column :pilot_races, :updated_at

  	remove_column :championships, :created_at
  	remove_column :championships, :updated_at

  	remove_column :admins, :created_at
  	remove_column :admins, :updated_at

  	remove_column :admin_users, :created_at
  	remove_column :admin_users, :updated_at

  end
end
