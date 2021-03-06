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

ActiveRecord::Schema.define(version: 20160427003441) do

  create_table "patients", force: :cascade do |t|
    t.string   "name",                                                                  null: false
    t.integer  "age",                                                                   null: false
    t.string   "identification",                                                        null: false
    t.string   "modality",                                                              null: false
    t.string   "catheter",                                                              null: false
    t.string   "caliber",                                                               null: false
    t.integer  "user_id"
    t.datetime "created_at",                                                            null: false
    t.datetime "updated_at",                                                            null: false
    t.string   "qualitative_scale"
    t.integer  "number_punctures",                                      default: 1
    t.boolean  "catheter_exchange",                                     default: false
    t.string   "sex"
    t.boolean  "oncological"
    t.boolean  "cardiovascular"
    t.boolean  "recent_intravenous_treatment"
    t.decimal  "injection_speed",              precision: 15, scale: 2
    t.boolean  "change_speed_injection"
    t.boolean  "injury"
    t.string   "injury_type"
    t.boolean  "fhlebitis"
    t.string   "fhlebitis_type"
    t.boolean  "puncture"
    t.boolean  "blood_exposure"
    t.string   "blood_exposure_type"
    t.integer  "insertion_pain"
    t.integer  "administration_pain"
    t.string   "type_procedure"
    t.boolean  "rupture"
    t.boolean  "complete_record"
  end

  add_index "patients", ["user_id", "created_at"], name: "index_patients_on_user_id_and_created_at"
  add_index "patients", ["user_id"], name: "index_patients_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
