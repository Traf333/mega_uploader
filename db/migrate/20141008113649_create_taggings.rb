class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.belongs_to :tag
      t.belongs_to :attachment

      t.timestamps
    end

    add_index :taggings, [:tag_id, :attachment_id], unique: true
    add_index :taggings, [:attachment_id, :tag_id], unique: true
  end
end
