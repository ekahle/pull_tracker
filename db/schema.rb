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

ActiveRecord::Schema.define(version: 20131011190828) do

  create_table "pulls", force: true do |t|
    t.string   "name"
    t.string   "status"
    t.date     "target_completion_date"
    t.text     "description"
    t.string   "file"
    t.string   "investigator"
    t.string   "requester"
    t.string   "pull_list_maker"
    t.string   "lab_contact_name"
    t.text     "notes_for_lab"
    t.boolean  "has_mta",                               default: false
    t.boolean  "has_budget",                            default: false
    t.boolean  "accepted_consent_to_long_term_storage", default: false
    t.boolean  "accepted_emory_specimens",              default: false
    t.boolean  "accepted_cold_chain_quality",           default: false
    t.boolean  "accepted_specimen_quality",             default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "specimen_type"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
