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

ActiveRecord::Schema.define(version: 20160217004950) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actors", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "actors_movies", id: false, force: :cascade do |t|
    t.integer "actor_id", null: false
    t.integer "movie_id", null: false
  end

  add_index "actors_movies", ["actor_id", "movie_id"], name: "index_actors_movies_on_actor_id_and_movie_id", using: :btree
  add_index "actors_movies", ["movie_id", "actor_id"], name: "index_actors_movies_on_movie_id_and_actor_id", using: :btree

  create_table "create_actor_movie_tables", force: :cascade do |t|
    t.integer  "actor_id"
    t.integer  "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "order_id"
  end

  add_index "items", ["order_id"], name: "index_items_on_order_id", using: :btree

  create_table "items_orders", id: false, force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "item_id",  null: false
  end

  add_index "items_orders", ["item_id", "order_id"], name: "index_items_orders_on_item_id_and_order_id", using: :btree
  add_index "items_orders", ["order_id", "item_id"], name: "index_items_orders_on_order_id_and_item_id", using: :btree

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "year"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "items", "orders"
end
