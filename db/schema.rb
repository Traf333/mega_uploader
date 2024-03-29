# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141008113649) do

  create_table "attachments", force: true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "item_file_name"
    t.string   "item_content_type"
    t.integer  "item_file_size"
    t.datetime "item_updated_at"
  end

  add_index "attachments", ["user_id"], name: "index_attachments_on_user_id"

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "attachment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taggings", ["attachment_id", "tag_id"], name: "index_taggings_on_attachment_id_and_tag_id", unique: true
  add_index "taggings", ["tag_id", "attachment_id"], name: "index_taggings_on_tag_id_and_attachment_id", unique: true

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
