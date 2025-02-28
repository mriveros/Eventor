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

ActiveRecord::Schema.define(version: 20170623233700) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attends", force: :cascade do |t|
    t.integer  "attendee_id"
    t.integer  "attended_event_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["attended_event_id"], name: "index_attends_on_attended_event_id", using: :btree
    t.index ["attendee_id", "attended_event_id"], name: "index_attends_on_attendee_id_and_attended_event_id", unique: true, using: :btree
    t.index ["attendee_id"], name: "index_attends_on_attendee_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "user_id"
    t.text     "body"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_comments_on_event_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "date"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "picture"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
    t.integer  "category_id"
    t.index ["category_id"], name: "index_events_on_category_id", using: :btree
    t.index ["user_id"], name: "index_events_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "comments", "events"
  add_foreign_key "events", "users"
end
