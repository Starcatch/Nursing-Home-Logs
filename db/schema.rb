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

ActiveRecord::Schema.define(version: 2020_07_16_001717) do

  create_table "daily_activities", force: :cascade do |t|
    t.string "title"
    t.string "description"
  end

  create_table "daily_logs", force: :cascade do |t|
    t.string "shift"
    t.string "notes"
    t.integer "user_id"
    t.integer "individual_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "individual_vitals_logs", force: :cascade do |t|
    t.string "temperature"
    t.string "bloodpressure"
    t.string "pulse"
    t.integer "individual_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "individuals", force: :cascade do |t|
    t.string "name"
    t.text "bio"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.boolean "admin", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "from"
    t.string "worked_to"
  end

  create_table "vitals_table_for_individuals", force: :cascade do |t|
    t.string "temperature"
    t.string "blood_pressure"
    t.string "pulse"
    t.integer "individual_id"
  end

end
