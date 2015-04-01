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

ActiveRecord::Schema.define(version: 20150401113206) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "entries", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "headline"
    t.text     "description"
    t.string   "url"
    t.string   "image"
    t.string   "uuid"
    t.string   "major"
    t.string   "minor"
    t.decimal  "x"
    t.decimal  "y"
  end

  add_index "entries", ["uuid", "major", "minor"], name: "index_entries_on_uuid_and_major_and_minor", using: :btree

  create_table "event_logs", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uuid"
    t.string   "major"
    t.string   "minor"
    t.string   "proximity"
    t.string   "rssi"
  end

end
