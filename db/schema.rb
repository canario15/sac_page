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

ActiveRecord::Schema.define(version: 20150728214953) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
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
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "albuns", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.date     "date_albun"
    t.integer  "category_id"
    t.string   "front_pic_file_name"
    t.string   "front_pic_content_type"
    t.integer  "front_pic_file_size"
    t.datetime "front_pic_updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "short_name"
  end

  create_table "categories_pilots", force: true do |t|
    t.integer "category_id"
    t.integer "pilot_id"
  end

  create_table "championships", force: true do |t|
    t.string  "name"
    t.integer "year"
    t.integer "one_id"
    t.integer "two_id"
    t.integer "three_id"
    t.integer "category_id"
  end

  create_table "circuits", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.text     "description"
    t.string   "large"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "map_position"
    t.integer  "category_id"
    t.string   "truck_file_name"
    t.string   "truck_content_type"
    t.integer  "truck_file_size"
    t.datetime "truck_updated_at"
  end

  create_table "notices", force: true do |t|
    t.string   "title"
    t.text     "context"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "pilot_races", force: true do |t|
    t.integer "pilot_id"
    t.integer "race_id"
    t.integer "number"
    t.integer "category_id"
  end

  add_index "pilot_races", ["pilot_id"], name: "index_pilot_races_on_pilot_id", using: :btree
  add_index "pilot_races", ["race_id"], name: "index_pilot_races_on_race_id", using: :btree

  create_table "pilot_steps", force: true do |t|
    t.integer "step_id"
    t.string  "time"
    t.integer "pilot_race_id"
    t.integer "score"
    t.integer "position"
  end

  add_index "pilot_steps", ["pilot_race_id"], name: "index_pilot_steps_on_pilot_race_id", using: :btree
  add_index "pilot_steps", ["step_id"], name: "index_pilot_steps_on_step_id", using: :btree

  create_table "pilots", force: true do |t|
    t.string   "full_name"
    t.string   "team"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "car"
    t.string   "city"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birth_date"
    t.string   "car_pic_file_name"
    t.string   "car_pic_content_type"
    t.integer  "car_pic_file_size"
    t.datetime "car_pic_updated_at"
    t.string   "helmet_pic_file_name"
    t.string   "helmet_pic_content_type"
    t.integer  "helmet_pic_file_size"
    t.datetime "helmet_pic_updated_at"
    t.string   "complete_pic_file_name"
    t.string   "complete_pic_content_type"
    t.integer  "complete_pic_file_size"
    t.datetime "complete_pic_updated_at"
  end

  create_table "race_results", force: true do |t|
    t.integer "pilot_race_id"
    t.integer "race_id"
    t.integer "score"
    t.integer "position"
    t.integer "score_for_champ"
    t.integer "championship_id"
    t.integer "category_id"
    t.integer "pilot_id"
  end

  add_index "race_results", ["pilot_race_id"], name: "index_race_results_on_pilot_race_id", using: :btree
  add_index "race_results", ["race_id"], name: "index_race_results_on_race_id", using: :btree

  create_table "races", force: true do |t|
    t.integer "championship_id"
    t.string  "city"
    t.date    "date"
    t.string  "name"
    t.text    "observation"
    t.boolean "done"
    t.integer "circuit_id"
  end

  add_index "races", ["championship_id"], name: "index_races_on_championship_id", using: :btree

  create_table "steps", force: true do |t|
    t.integer "race_id"
    t.integer "number"
    t.string  "name"
    t.text    "observation"
  end

  add_index "steps", ["race_id"], name: "index_steps_on_race_id", using: :btree

end
