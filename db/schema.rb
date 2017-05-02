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

ActiveRecord::Schema.define(version: 20170501093026) do

  create_table "admins", force: :cascade do |t|
    t.string   "username",                                    null: false
    t.string   "email",                                       null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
    t.integer  "failed_logins_count",             default: 0
    t.datetime "lock_expires_at"
    t.string   "unlock_token"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.index ["activation_token"], name: "index_admins_on_activation_token"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["remember_me_token"], name: "index_admins_on_remember_me_token"
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token"
    t.index ["unlock_token"], name: "index_admins_on_unlock_token"
  end

  create_table "events", force: :cascade do |t|
    t.integer  "admin_id"
    t.string   "name",        limit: 64, null: false
    t.text     "description"
    t.string   "link"
    t.datetime "start_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["admin_id"], name: "index_events_on_admin_id"
  end

end
