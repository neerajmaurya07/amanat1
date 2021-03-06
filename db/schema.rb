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

ActiveRecord::Schema.define(version: 20170131180320) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "mehmen", force: :cascade do |t|
    t.string   "full_name"
    t.string   "passport_no"
    t.string   "country"
    t.date     "arrival_date"
    t.string   "arrival_info"
    t.date     "departure_date"
    t.string   "departure_info"
    t.date     "visa_expiry_date"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "status",           default: 0
    t.integer  "level"
    t.integer  "user_id"
    t.string   "code"
    t.index ["code"], name: "index_mehmen_on_code", unique: true, using: :btree
    t.index ["passport_no"], name: "index_mehmen_on_passport_no", unique: true, using: :btree
    t.index ["user_id"], name: "index_mehmen_on_user_id", using: :btree
  end

  create_table "searches", force: :cascade do |t|
    t.string   "keywords"
    t.string   "country"
    t.date     "arrival_date_from"
    t.date     "arrival_date_to"
    t.date     "visa_expiry_date_from"
    t.date     "visa_expiry_date_to"
    t.integer  "status"
    t.integer  "level"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "visas", force: :cascade do |t|
    t.string   "file_no"
    t.date     "submission_date"
    t.date     "apply_date"
    t.integer  "status",          default: 0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "mehman_id"
    t.index ["mehman_id"], name: "index_visas_on_mehman_id", using: :btree
  end

  add_foreign_key "mehmen", "users"
  add_foreign_key "visas", "mehmen"
end
