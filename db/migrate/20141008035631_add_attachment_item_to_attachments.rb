class AddAttachmentItemToAttachments < ActiveRecord::Migration
  def self.up
    change_table :attachments do |t|
      t.attachment :item
    end
  end

  def self.down
    remove_attachment :attachments, :item
  end
end
