class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :title
      t.references :user, index: true

      t.timestamps
    end
  end
end
