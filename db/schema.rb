# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_10_01_013836) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "downloads", force: :cascade do |t|
    t.bigint "song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["song_id"], name: "index_downloads_on_song_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "title", null: false
    t.string "length", null: false
    t.float "filesize", null: false
    t.bigint "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "downloads_count"
    t.index ["artist_id"], name: "index_songs_on_artist_id"
  end

  add_foreign_key "downloads", "songs"
  add_foreign_key "songs", "artists"
end
