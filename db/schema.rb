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

ActiveRecord::Schema.define(version: 20140626220722) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: true do |t|
    t.string   "name"
    t.string   "common_name"
    t.string   "language"
    t.float    "political_stability"
    t.integer  "corruption_index"
    t.string   "travel_warning"
    t.string   "two_character_code"
    t.string   "three_character_code"
    t.string   "language_code"
    t.string   "currency"
    t.boolean  "is_malaria_hotspot"
    t.string   "cuisine"
    t.text     "intro"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: true do |t|
    t.integer  "country_id"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "languages", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phrases", force: true do |t|
    t.integer  "country_id"
    t.string   "hello"
    t.string   "please"
    t.string   "thanks"
    t.string   "bathroom"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
