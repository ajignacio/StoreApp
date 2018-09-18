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

ActiveRecord::Schema.define(version: 2018_09_16_132924) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "baskets", force: :cascade do |t|
    t.string "status", default: "order"
    t.string "email"
    t.string "phone"
    t.text "user_cookie"
    t.datetime "date_order"
    t.bigint "product_id"
    t.integer "qty", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_baskets_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.decimal "price", precision: 6, scale: 2
    t.string "image"
    t.bigint "vat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vat_id"], name: "index_products_on_vat_id"
  end

  create_table "vats", force: :cascade do |t|
    t.string "name"
    t.decimal "percent", precision: 4, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "products", "vats"
end
