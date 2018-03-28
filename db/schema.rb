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

ActiveRecord::Schema.define(version: 20180328010647) do

  create_table "activities", force: :cascade do |t|
    t.string "title"
    t.string "comment"
    t.string "location"
    t.date "activity_date"
    t.integer "itinerary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.string "spot_type"
    t.decimal "value"
    t.string "cuisine"
    t.string "price_rating"
    t.index ["itinerary_id"], name: "index_activities_on_itinerary_id"
  end

  create_table "itineraries", force: :cascade do |t|
    t.string "location"
    t.string "season"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "trip_plan_id"
    t.index ["trip_plan_id"], name: "index_itineraries_on_trip_plan_id"
  end

  create_table "trip_plans", force: :cascade do |t|
    t.string "title"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
