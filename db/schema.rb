ActiveRecord::Schema.define(version: 20140227144354) do

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_disabled",            default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
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
  end

  add_index "wars", ["name"], name: "index_wars_on_name", using: :btree
  add_index "wars", ["owner_id"], name: "index_wars_on_owner_id", using: :btree
  add_index "wars", ["winner_id"], name: "index_wars_on_winner_id", using: :btree

end
