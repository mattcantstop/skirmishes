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

ActiveRecord::Schema.define(version: 20140321140313) do

  create_table "battles", force: true do |t|
    t.integer  "winner_id"
    t.integer  "user_id"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "war_id"
  end

  create_table "participants", id: false, force: true do |t|
    t.integer "user_id", null: false
    t.integer "war_id",  null: false
  end

  create_table "users", force: true do |t|
    t.string   "email",                default: "",    null: false
    t.string   "password_digest",      default: "",    null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_disabled",          default: false
    t.string   "authentication_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "wars", force: true do |t|
    t.string   "name"
    t.boolean  "has_end"
    t.datetime "ending_date"
    t.integer  "ending_score"
    t.string   "booty"
    t.boolean  "is_private"
    t.boolean  "open_registration"
    t.boolean  "is_complete",       default: false
    t.integer  "winner_id"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_disabled",       default: false
  end

  add_index "wars", ["name"], name: "index_wars_on_name", using: :btree
  add_index "wars", ["owner_id"], name: "index_wars_on_owner_id", using: :btree
  add_index "wars", ["winner_id"], name: "index_wars_on_winner_id", using: :btree

end
