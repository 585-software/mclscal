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

ActiveRecord::Schema.define(version: 2018_08_08_235912) do

  create_table "campuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer "foreign_id"
    t.string "title"
    t.text "description"
    t.datetime "start_at"
    t.datetime "end_at"
    t.string "url"
    t.integer "campus_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campus_id"], name: "index_events_on_campus_id"
    t.index ["end_at"], name: "index_events_on_end_at"
    t.index ["foreign_id"], name: "index_events_on_foreign_id"
    t.index ["start_at"], name: "index_events_on_start_at"
  end

end
