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

ActiveRecord::Schema.define(version: 20170309144758) do

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
    t.string   "mimage"
  end

  add_index "films", ["genre1_id"], name: "index_films_on_genre1_id"
  add_index "films", ["genre2_id"], name: "index_films_on_genre2_id"
  add_index "films", ["rating_id"], name: "index_films_on_rating_id"

  create_table "genres", force: :cascade do |t|
    t.string   "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.string   "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
