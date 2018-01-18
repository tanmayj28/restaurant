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

ActiveRecord::Schema.define(version: 20180114064712) do

  create_table "customers", force: :cascade do |t|
    t.string   "name",                 limit: 255
    t.string   "phone",                limit: 255
    t.string   "address",              limit: 255
    t.integer  "no_of_people",         limit: 4
    t.integer  "restaurant_system_id", limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "customers", ["restaurant_system_id"], name: "index_customers_on_restaurant_system_id", using: :btree

  create_table "invoices", force: :cascade do |t|
    t.string   "dish_name",            limit: 255
    t.decimal  "dish_price",                       precision: 10
    t.decimal  "total",                            precision: 10
    t.integer  "restaurant_system_id", limit: 4
    t.integer  "customer_id",          limit: 4
    t.integer  "order_id",             limit: 4
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "invoices", ["customer_id"], name: "index_invoices_on_customer_id", using: :btree
  add_index "invoices", ["order_id"], name: "index_invoices_on_order_id", using: :btree
  add_index "invoices", ["restaurant_system_id"], name: "index_invoices_on_restaurant_system_id", using: :btree

  create_table "menus", force: :cascade do |t|
    t.string   "dish_name",            limit: 255
    t.string   "dish_description",     limit: 255
    t.decimal  "dish_price",                       precision: 10
    t.integer  "restaurant_system_id", limit: 4
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "menus", ["restaurant_system_id"], name: "index_menus_on_restaurant_system_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.string   "dish_name",   limit: 255
    t.decimal  "dish_price",              precision: 10
    t.integer  "menu_id",     limit: 4
    t.integer  "customer_id", limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id", using: :btree
  add_index "orders", ["menu_id"], name: "index_orders_on_menu_id", using: :btree

  create_table "restaurant_systems", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "phone",      limit: 255
    t.string   "address",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "customers", "restaurant_systems"
  add_foreign_key "invoices", "customers"
  add_foreign_key "invoices", "orders"
  add_foreign_key "invoices", "restaurant_systems"
  add_foreign_key "menus", "restaurant_systems"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "menus"
end
