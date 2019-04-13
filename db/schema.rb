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

ActiveRecord::Schema.define(version: 2019_04_13_080733) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "flrs", force: :cascade do |t|
    t.float "number"
    t.date "start_date"
    t.string "info"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "current", default: false
    t.integer "last_page"
  end

  create_table "groups", force: :cascade do |t|
    t.integer "number"
    t.string "name"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "flr_id"
    t.bigint "user_id"
    t.index ["flr_id"], name: "index_groups_on_flr_id"
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "body"
    t.string "link"
    t.string "author"
    t.bigint "flr_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flr_id"], name: "index_messages_on_flr_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "story_id"
    t.text "text"
    t.string "link"
    t.string "author"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["story_id"], name: "index_reviews_on_story_id"
  end

  create_table "stories", force: :cascade do |t|
    t.string "name"
    t.string "link"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_stories_on_group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "groups", "flrs"
  add_foreign_key "groups", "users"
  add_foreign_key "messages", "flrs"
  add_foreign_key "reviews", "stories"
  add_foreign_key "stories", "groups"
end
