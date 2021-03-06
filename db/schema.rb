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

ActiveRecord::Schema.define(version: 20140612202606) do

  create_table "cookbook_recipes", force: true do |t|
    t.integer "cookbook_id"
    t.integer "recipe_id"
    t.text    "notes"
  end

  create_table "cookbooks", force: true do |t|
    t.integer  "user_id",       null: false
    t.string   "saved_recipes"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "endorsements", force: true do |t|
    t.text     "comments",             null: false
    t.integer  "stars",      limit: 1, null: false
    t.integer  "recipe_id",            null: false
    t.integer  "user_id",              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
  end

  add_index "endorsements", ["recipe_id"], name: "index_endorsements_on_recipe_id"
  add_index "endorsements", ["user_id"], name: "index_endorsements_on_user_id"

  create_table "ingredients", force: true do |t|
    t.string   "name",        limit: 20, null: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ingredients", ["name"], name: "index_ingredients_on_name", unique: true

  create_table "recipe_ingredients", force: true do |t|
    t.integer  "recipe_id",                     null: false
    t.integer  "ingredient_id",                 null: false
    t.string   "name",                          null: false
    t.string   "description"
    t.float    "quantity"
    t.string   "units"
    t.boolean  "optional",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipe_utensils", force: true do |t|
    t.integer "recipe_id"
    t.integer "utensil_id"
  end

  create_table "recipes", force: true do |t|
    t.text     "instructions",                 null: false
    t.text     "description"
    t.integer  "user_id",                      null: false
    t.string   "dishname",                     null: false
    t.float    "rating"
    t.boolean  "rated",        default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recipes", ["dishname"], name: "index_recipes_on_dishname", unique: true
  add_index "recipes", ["user_id"], name: "index_recipes_on_user_id"

  create_table "user_ingredients", force: true do |t|
    t.integer "user_id",       null: false
    t.integer "ingredient_id", null: false
    t.float   "quantity"
    t.string  "units"
    t.string  "name",          null: false
  end

  add_index "user_ingredients", ["ingredient_id"], name: "index_user_ingredients_on_ingredient_id"
  add_index "user_ingredients", ["user_id"], name: "index_user_ingredients_on_user_id"

  create_table "users", force: true do |t|
    t.string   "username",        limit: 15,                 null: false
    t.string   "password_digest",                            null: false
    t.boolean  "admin",                      default: false
    t.string   "session_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

  create_table "utensils", force: true do |t|
    t.string   "name",        limit: 20, null: false
    t.text     "description",            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "utensils", ["name"], name: "index_utensils_on_name", unique: true

end
