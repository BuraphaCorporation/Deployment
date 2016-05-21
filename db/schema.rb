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

ActiveRecord::Schema.define(version: 20160521002353) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_attachments", force: :cascade do |t|
    t.integer  "event_id"
    t.string   "media_file_name"
    t.string   "media_content_type"
    t.integer  "media_file_size"
    t.datetime "media_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "event_attachments", ["event_id"], name: "index_event_attachments_on_event_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "from_to"
    t.string   "location"
    t.decimal  "latitude",    precision: 10, scale: 6
    t.decimal  "longitude",   precision: 10, scale: 6
    t.string   "categories"
    t.integer  "price"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "from_to_dates", force: :cascade do |t|
    t.integer  "event_id"
    t.datetime "from_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "from_to_dates", ["event_id"], name: "index_from_to_dates_on_event_id", using: :btree

  create_table "payments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.string   "provider"
    t.integer  "amount"
    t.integer  "fee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "payments", ["event_id"], name: "index_payments_on_event_id", using: :btree
  add_index "payments", ["user_id"], name: "index_payments_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "taggings", ["event_id"], name: "index_taggings_on_event_id", using: :btree
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "tickets", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.integer  "from_to_date_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "tickets", ["event_id"], name: "index_tickets_on_event_id", using: :btree
  add_index "tickets", ["from_to_date_id"], name: "index_tickets_on_from_to_date_id", using: :btree
  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "gender"
    t.date     "birthday"
    t.string   "phone"
    t.string   "interesting"
    t.string   "company"
    t.string   "url"
    t.text     "short_description"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.integer  "role_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  create_table "wishlists", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "wishlists", ["event_id"], name: "index_wishlists_on_event_id", using: :btree
  add_index "wishlists", ["user_id"], name: "index_wishlists_on_user_id", using: :btree

  add_foreign_key "event_attachments", "events"
  add_foreign_key "events", "users"
  add_foreign_key "from_to_dates", "events"
  add_foreign_key "payments", "events"
  add_foreign_key "payments", "users"
  add_foreign_key "taggings", "events"
  add_foreign_key "taggings", "tags"
  add_foreign_key "tickets", "events"
  add_foreign_key "tickets", "from_to_dates"
  add_foreign_key "tickets", "users"
  add_foreign_key "users", "roles"
  add_foreign_key "wishlists", "events"
  add_foreign_key "wishlists", "users"
end
