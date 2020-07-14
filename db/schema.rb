# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_14_044758) do

  create_table "daily_activities", force: :cascade do |t|
    t.string "title"
    t.string "description"
  end

  create_table "daily_log_daily_activities", force: :cascade do |t|
    t.integer "daily_log_id"
    t.integer "daily_activity_id"
  end

  create_table "daily_log_individuals", force: :cascade do |t|
    t.integer "individual_id"
    t.integer "daily_log_id"
  end

  create_table "daily_logs", force: :cascade do |t|
    t.string "shift"
    t.string "notes"
    t.integer "user_id"
  end

  create_table "individuals", force: :cascade do |t|
    t.string "name"
    t.text "bio"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.boolean "admin", default: false
  end

end
