# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_05_30_162457) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "scrape_logs", force: :cascade do |t|
    t.bigint "spot_id", null: false
    t.datetime "scrape_time"
    t.float "swell_size"
    t.string "wind_direction"
    t.string "swell_direction"
    t.string "tide"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "swell_period"
    t.index ["spot_id"], name: "index_scrape_logs_on_spot_id"
  end

  create_table "spots", force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "spot_name"
    t.integer "ideal_swell_direction"
    t.integer "lower_swell_direction"
    t.integer "upper_swell_direction"
    t.integer "ideal_wave_force"
    t.integer "ideal_wind_direction"
    t.integer "lower_wind_direction"
    t.integer "upper_wind_direction"
    t.string "ideal_tide"
    t.integer "wave_quality"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "scrape_logs", "spots"
end
