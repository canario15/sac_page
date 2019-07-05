class AddAvatarToPilot < ActiveRecord::Migration[5.1]
    def self.up
    change_table :pilots do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :pilots, :avatar
  end
end
