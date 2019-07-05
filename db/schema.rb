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

ActiveRecord::Schema.define(version: 20160524235653) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_id", null: false
    t.string "resource_type", null: false
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "albuns", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.date "date_albun"
    t.integer "category_id"
    t.string "front_pic_file_name"
    t.string "front_pic_content_type"
    t.bigint "front_pic_file_size"
    t.datetime "front_pic_updated_at"
    t.boolean "is_global"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.bigint "logo_file_size"
    t.datetime "logo_updated_at"
    t.string "short_name"
  end

  create_table "categories_pilots", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "pilot_id"
    t.index ["category_id"], name: "index_categories_pilots_on_category_id"
    t.index ["pilot_id"], name: "index_categories_pilots_on_pilot_id"
  end

  create_table "championships", force: :cascade do |t|
    t.string "name"
    t.integer "year"
    t.integer "one_id"
    t.integer "two_id"
    t.integer "three_id"
    t.bigint "category_id"
    t.string "sub_category"
    t.index ["category_id"], name: "index_championships_on_category_id"
  end

  create_table "circuit_pictures", force: :cascade do |t|
    t.string "picture_file_name"
    t.string "picture_content_type"
    t.bigint "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer "circuit_id"
    t.string "name"
  end

  create_table "circuits", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.text "description"
    t.string "large"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.bigint "logo_file_size"
    t.datetime "logo_updated_at"
    t.string "map_position"
    t.integer "category_id"
    t.string "truck_file_name"
    t.string "truck_content_type"
    t.bigint "truck_file_size"
    t.datetime "truck_updated_at"
    t.string "video_url"
  end

  create_table "notices", force: :cascade do |t|
    t.string "title"
    t.text "context"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.bigint "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "pilot_races", force: :cascade do |t|
    t.bigint "pilot_id"
    t.bigint "race_id"
    t.integer "number"
    t.integer "category_id"
    t.index ["pilot_id"], name: "index_pilot_races_on_pilot_id"
    t.index ["race_id"], name: "index_pilot_races_on_race_id"
  end

  create_table "pilot_steps", force: :cascade do |t|
    t.bigint "step_id"
    t.string "time"
    t.bigint "pilot_race_id"
    t.integer "score"
    t.integer "position"
    t.index ["pilot_race_id"], name: "index_pilot_steps_on_pilot_race_id"
    t.index ["step_id"], name: "index_pilot_steps_on_step_id"
  end

  create_table "pilots", force: :cascade do |t|
    t.string "full_name"
    t.string "team"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.bigint "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string "car"
    t.string "city"
    t.string "first_name"
    t.string "last_name"
    t.date "birth_date"
    t.string "car_pic_file_name"
    t.string "car_pic_content_type"
    t.bigint "car_pic_file_size"
    t.datetime "car_pic_updated_at"
    t.string "helmet_pic_file_name"
    t.string "helmet_pic_content_type"
    t.bigint "helmet_pic_file_size"
    t.datetime "helmet_pic_updated_at"
    t.string "complete_pic_file_name"
    t.string "complete_pic_content_type"
    t.bigint "complete_pic_file_size"
    t.datetime "complete_pic_updated_at"
    t.boolean "active"
  end

  create_table "race_previus", force: :cascade do |t|
    t.integer "race_id"
    t.integer "ticket"
    t.text "crono"
    t.string "picture_file_name"
    t.string "picture_content_type"
    t.bigint "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer "box_ticket"
  end

  create_table "race_results", force: :cascade do |t|
    t.bigint "pilot_race_id"
    t.bigint "race_id"
    t.integer "score"
    t.integer "position"
    t.integer "score_for_champ"
    t.integer "championship_id"
    t.integer "category_id"
    t.integer "pilot_id"
    t.index ["pilot_race_id"], name: "index_race_results_on_pilot_race_id"
    t.index ["race_id"], name: "index_race_results_on_race_id"
  end

  create_table "races", force: :cascade do |t|
    t.bigint "championship_id"
    t.string "city"
    t.date "date"
    t.string "name"
    t.text "observation"
    t.boolean "done"
    t.integer "circuit_id"
    t.index ["championship_id"], name: "index_races_on_championship_id"
  end

  create_table "steps", force: :cascade do |t|
    t.bigint "race_id"
    t.integer "number"
    t.string "name"
    t.text "observation"
    t.index ["race_id"], name: "index_steps_on_race_id"
  end

end
