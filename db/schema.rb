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

ActiveRecord::Schema.define(version: 20160104123619) do

  create_table "beacons", force: :cascade do |t|
    t.string   "name",              default: "", null: false
    t.string   "model",             default: "", null: false
    t.string   "uuid",              default: "", null: false
    t.integer  "major",             default: 1,  null: false
    t.integer  "minor",             default: 1,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "unique_sync_id",    default: ""
    t.string   "unique_identifier",              null: false
  end

  add_index "beacons", ["unique_identifier"], name: "index_beacons_on_unique_identifier", unique: true

  create_table "events", force: :cascade do |t|
    t.string   "type",       default: "EventText", null: false
    t.integer  "kind",       default: 0,           null: false
    t.boolean  "active",     default: false,       null: false
    t.integer  "beacon_id"
    t.text     "payload"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["beacon_id"], name: "index_events_on_beacon_id"

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at"

  create_table "settings", force: :cascade do |t|
    t.string   "var",                   null: false
    t.text     "value"
    t.integer  "thing_id"
    t.string   "thing_type", limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true

end
