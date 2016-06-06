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

ActiveRecord::Schema.define(version: 20160420052504) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drill_logs", force: :cascade do |t|
    t.integer  "hole_id"
    t.integer  "from"
    t.integer  "to"
    t.integer  "num_pails"
    t.text     "rock_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "drill_logs", ["hole_id"], name: "index_drill_logs_on_hole_id", using: :btree

  create_table "holes", force: :cascade do |t|
    t.string   "ID"
    t.datetime "date"
    t.decimal  "lat"
    t.decimal  "lng"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "samples", force: :cascade do |t|
    t.integer  "hole_id"
    t.integer  "from"
    t.integer  "to"
    t.text     "rock_type"
    t.integer  "discharge"
    t.text     "gold"
    t.text     "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "samples", ["hole_id"], name: "index_samples_on_hole_id", using: :btree

  add_foreign_key "drill_logs", "holes"
  add_foreign_key "samples", "holes"
end
