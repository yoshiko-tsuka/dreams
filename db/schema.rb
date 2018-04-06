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

ActiveRecord::Schema.define(version: 20180406103000) do

  create_table "chapters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "chapter_title"
    t.text     "content",       limit: 65535
    t.boolean  "active",                      default: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "novel_id"
    t.index ["novel_id"], name: "index_chapters_on_novel_id", using: :btree
  end

  create_table "friendships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "type"
    t.integer  "user_id"
    t.integer  "novel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["novel_id"], name: "index_friendships_on_novel_id", using: :btree
    t.index ["user_id", "novel_id", "type"], name: "index_friendships_on_user_id_and_novel_id_and_type", unique: true, using: :btree
    t.index ["user_id"], name: "index_friendships_on_user_id", using: :btree
  end

  create_table "novels", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.integer  "user_id"
    t.string   "atmosphere", default: "色々"
    t.boolean  "active",     default: false
    t.boolean  "dream",      default: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "resume",     default: "設定されていません"
    t.index ["user_id"], name: "index_novels_on_user_id", using: :btree
  end

  create_table "ownerships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "novel_id"
    t.integer  "chapter_id"
    t.integer  "chapter_num", default: 1
    t.integer  "page_num",    default: 1
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["chapter_id"], name: "index_ownerships_on_chapter_id", using: :btree
    t.index ["novel_id"], name: "index_ownerships_on_novel_id", using: :btree
  end

  create_table "relationships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "follow_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follow_id"], name: "index_relationships_on_follow_id", using: :btree
    t.index ["user_id", "follow_id"], name: "index_relationships_on_user_id_and_follow_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_relationships_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "user_name"
    t.string   "user_code"
    t.string   "password_digest"
    t.string   "profile",         default: "プロフィールは設定されていません"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_foreign_key "chapters", "novels"
  add_foreign_key "friendships", "novels"
  add_foreign_key "friendships", "users"
  add_foreign_key "novels", "users"
  add_foreign_key "ownerships", "chapters"
  add_foreign_key "ownerships", "novels"
  add_foreign_key "relationships", "users"
  add_foreign_key "relationships", "users", column: "follow_id"
end
