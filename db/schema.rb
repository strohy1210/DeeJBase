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

ActiveRecord::Schema.define(version: 20150615182703) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rating_id"
  end

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "dj_genres", force: true do |t|
    t.integer  "dj_id"
    t.integer  "genre_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "djs", force: true do |t|
    t.string   "name"
    t.string   "image_url"
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid"
    t.string   "past_venues"
    t.string   "email"
    t.string   "phone"
    t.boolean  "dj_status"
    t.integer  "sdcl_followers"
    t.integer  "sdcl_id"
    t.string   "city"
    t.string   "twitter_hdl"
    t.boolean  "agent_status",        default: false
    t.string   "rate"
    t.boolean  "can_produce",         default: false
    t.string   "slug"
    t.integer  "fb_likes"
    t.string   "fbpage_id"
    t.text     "fb_bio"
    t.integer  "talking_about_count"
    t.string   "fb_location"
    t.datetime "rated_at"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.date     "date"
    t.time     "time"
    t.text     "description"
    t.integer  "dj_id"
    t.integer  "venue_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "promoter_id"
    t.integer  "festival_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "festivals", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_url"
    t.datetime "rated_at"
  end

  create_table "genres", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "neighborhoods", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "promoters", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.text     "description"
    t.string   "image_url"
    t.datetime "rated_at"
  end

  create_table "ratings", force: true do |t|
    t.float    "score",      default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "seen_live"
    t.integer  "event_id"
  end

  create_table "replies", force: true do |t|
    t.text    "body"
    t.integer "comment_id"
  end

  create_table "tracks", force: true do |t|
    t.string  "demo"
    t.integer "dj_id"
    t.integer "playback_count"
    t.integer "favoritings_count"
    t.string  "title"
    t.text    "tag_list"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.boolean  "venue_status", default: false
    t.boolean  "dj_status"
    t.integer  "sdcl_id"
    t.string   "uid"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "phone"
    t.string   "first_name"
    t.string   "gender"
    t.boolean  "vip",          default: false
  end

  create_table "venues", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone"
    t.string   "image_url"
    t.string   "cross_streets"
    t.string   "hood"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "yelp_rating"
    t.string   "yelp_id"
    t.string   "category"
    t.integer  "neighborhood_id"
    t.datetime "rated_at"
    t.string   "slug"
    t.integer  "priority"
  end

end
