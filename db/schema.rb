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

ActiveRecord::Schema.define(version: 20170318185628) do

  create_table "addresses", force: :cascade do |t|
    t.string   "house_name"
    t.string   "house_number"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.integer  "postcode_id"
    t.integer  "county_id"
    t.integer  "country_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "addresses", ["country_id"], name: "index_addresses_on_country_id"
  add_index "addresses", ["county_id"], name: "index_addresses_on_county_id"
  add_index "addresses", ["postcode_id"], name: "index_addresses_on_postcode_id"

  create_table "counties", force: :cascade do |t|
    t.string   "county"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "country_id"
  end

  add_index "counties", ["country_id"], name: "index_counties_on_country_id"
  add_index "counties", ["county"], name: "index_counties_on_county"

  create_table "countries", force: :cascade do |t|
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "countries", ["country"], name: "index_countries_on_country"

  create_table "films", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "genre1_id"
    t.integer  "genre2_id"
    t.integer  "rating_id"
    t.string   "image1"
    t.string   "release_year"
    t.integer  "blu_ray_stock"
    t.integer  "dvd_stock"
    t.boolean  "active",        default: false
  end

  add_index "films", ["genre1_id"], name: "index_films_on_genre1_id"
  add_index "films", ["genre2_id"], name: "index_films_on_genre2_id"
  add_index "films", ["rating_id"], name: "index_films_on_rating_id"

  create_table "genres", force: :cascade do |t|
    t.string   "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "postcodes", force: :cascade do |t|
    t.string   "postcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.string   "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
