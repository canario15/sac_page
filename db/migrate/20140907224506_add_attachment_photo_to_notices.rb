class AddAttachmentPhotoToNotices < ActiveRecord::Migration[5.1]
  def self.up
    change_table :notices do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :notices, :photo
  end
end
