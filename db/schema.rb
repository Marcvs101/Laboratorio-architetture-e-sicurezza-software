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

ActiveRecord::Schema.define(version: 20170720140754) do

  create_table "ads", force: :cascade do |t|
    t.text     "description"
    t.string   "type"
    t.text     "location"
    t.text     "delivery"
    t.integer  "user_id"
    t.integer  "game_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "ads", ["game_id"], name: "index_ads_on_game_id"
  add_index "ads", ["user_id"], name: "index_ads_on_user_id"

  create_table "games", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "genre"
    t.string   "pegi"
    t.string   "year"
    t.string   "maker"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "games", ["user_id"], name: "index_games_on_user_id"

  create_table "reportables", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.text     "description"
    t.integer  "reportable_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "reports", ["reportable_id"], name: "index_reports_on_reportable_id"
  add_index "reports", ["user_id"], name: "index_reports_on_user_id"

  create_table "responses", force: :cascade do |t|
    t.integer  "ad_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "responses", ["ad_id"], name: "index_responses_on_ad_id"
  add_index "responses", ["user_id"], name: "index_responses_on_user_id"

  create_table "reviews", force: :cascade do |t|
    t.text     "description"
    t.integer  "rating"
    t.integer  "user_id"
    t.integer  "game_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "reviews", ["game_id"], name: "index_reviews_on_game_id"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "lastname"
    t.string   "email"
    t.string   "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
