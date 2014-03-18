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

ActiveRecord::Schema.define(version: 20140317012017) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cookbooks", force: true do |t|
    t.integer  "user_id",       null: false
    t.integer  "recipe_id"
    t.string   "saved_recipes"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cookbooks_recipes", id: false, force: true do |t|
    t.integer "cookbook_id"
    t.integer "recipe_id"
  end

  create_table "endorsements", force: true do |t|
    t.text     "comments"
    t.integer  "stars",      limit: 2
    t.integer  "recipe_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ingredients", force: true do |t|
    t.string   "name",        limit: 20, null: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ingredients", ["name"], name: "index_ingredients_on_name", unique: true, using: :btree

  create_table "ingredients_recipes", id: false, force: true do |t|
    t.integer "ingredient_id"
    t.integer "recipe_id"
  end

  create_table "ingredients_users", id: false, force: true do |t|
    t.integer "ingredient_id"
    t.integer "user_id"
  end

  create_table "recipes", force: true do |t|
    t.text     "instructions",                  null: false
    t.integer  "cookbook_id"
    t.integer  "user_id",                       null: false
    t.integer  "ingredient_id"
    t.integer  "utensil_id"
    t.string   "dishname",                      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "rating"
    t.boolean  "rated",         default: false
  end

  create_table "recipes_utensils", id: false, force: true do |t|
    t.integer "recipe_id"
    t.integer "utensil_id"
  end

  create_table "users", force: true do |t|
    t.string   "username",        limit: 15, null: false
    t.string   "password_digest",            null: false
    t.string   "session_token"
    t.integer  "cookbook_id"
    t.integer  "ingredient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "utensils", force: true do |t|
    t.string   "name",        limit: 20, null: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "utensils", ["name"], name: "index_utensils_on_name", unique: true, using: :btree

end
