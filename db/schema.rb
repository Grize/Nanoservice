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

ActiveRecord::Schema.define(version: 2018_09_29_203013) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "messages", force: :cascade do |t|
    t.string "sender", null: false
    t.string "addressee", null: false
    t.text "body", null: false
    t.boolean "sent", default: false
    t.datetime "send_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages_messangers", id: false, force: :cascade do |t|
    t.bigint "message_id"
    t.bigint "messanger_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_messages_messangers_on_message_id"
    t.index ["messanger_id"], name: "index_messages_messangers_on_messanger_id"
  end

  create_table "messangers", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
