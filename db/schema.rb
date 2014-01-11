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

ActiveRecord::Schema.define(version: 20140106051556) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: true do |t|
    t.integer  "place_id"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "card_image_file_name"
    t.string   "card_image_content_type"
    t.integer  "card_image_file_size"
    t.datetime "card_image_updated_at"
  end

  add_index "cards", ["place_id"], name: "index_cards_on_place_id", using: :btree

  create_table "pins", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "card_id"
    t.integer  "user_id"
    t.string   "description"
    t.integer  "position"
  end

  add_index "pins", ["card_id", "user_id"], name: "index_pins_on_card_id_and_user_id", using: :btree

  create_table "places", force: true do |t|
    t.string   "name",          limit: 50
    t.float    "latitude",                 default: 0.0
    t.float    "longitude",                default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location_type"
    t.string   "city",          limit: 40
    t.string   "country",       limit: 40
  end

  add_index "places", ["name"], name: "index_places_on_name", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name",      limit: 25
    t.string   "last_name",       limit: 50
    t.string   "email",                      default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",        limit: 25
    t.string   "password_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", using: :btree

end
