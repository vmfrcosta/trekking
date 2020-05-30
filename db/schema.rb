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

ActiveRecord::Schema.define(version: 2020_05_30_182258) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.bigint "country_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_cities_on_country_id"
  end

  create_table "continents", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.bigint "continent_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["continent_id"], name: "index_countries_on_continent_id"
  end

  create_table "packages", force: :cascade do |t|
    t.bigint "origin_city_id", null: false
    t.bigint "origin_country_id", null: false
    t.bigint "destiny_city_id", null: false
    t.bigint "destiny_country_id", null: false
    t.datetime "departure_date"
    t.datetime "departure_time"
    t.datetime "arrival_date"
    t.datetime "arrival_time"
    t.integer "price"
    t.string "description"
    t.string "title"
    t.bigint "vacation_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["destiny_city_id"], name: "index_packages_on_destiny_city_id"
    t.index ["destiny_country_id"], name: "index_packages_on_destiny_country_id"
    t.index ["origin_city_id"], name: "index_packages_on_origin_city_id"
    t.index ["origin_country_id"], name: "index_packages_on_origin_country_id"
    t.index ["vacation_id"], name: "index_packages_on_vacation_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vacations", force: :cascade do |t|
    t.bigint "country_id", null: false
    t.string "title"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_vacations_on_country_id"
  end

  add_foreign_key "cities", "countries"
  add_foreign_key "countries", "continents"
  add_foreign_key "packages", "cities", column: "destiny_city_id"
  add_foreign_key "packages", "cities", column: "origin_city_id"
  add_foreign_key "packages", "countries", column: "destiny_country_id"
  add_foreign_key "packages", "countries", column: "origin_country_id"
  add_foreign_key "packages", "vacations"
  add_foreign_key "vacations", "countries"
end
