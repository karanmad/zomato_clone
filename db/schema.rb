# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_10_223411) do

  create_table "book_tables", force: :cascade do |t|
    t.date "date", null: false
    t.time "time", null: false
    t.integer "heads", null: false
    t.integer "user_id", null: false
    t.integer "restaurant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_book_tables_on_restaurant_id"
    t.index ["user_id"], name: "index_book_tables_on_user_id"
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "quantity", default: 1
    t.integer "food_item_id", null: false
    t.integer "cart_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["food_item_id"], name: "index_cart_items_on_food_item_id"
  end

  create_table "carts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.boolean "final", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "food_items", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "price", null: false
    t.integer "restaurant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_food_items_on_restaurant_id"
  end

  create_table "food_uploads", force: :cascade do |t|
    t.integer "restaurant_id", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.integer "review_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_food_uploads_on_restaurant_id"
    t.index ["review_id"], name: "index_food_uploads_on_review_id"
  end

  create_table "menu_uploads", force: :cascade do |t|
    t.integer "restaurant_id", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.integer "review_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_menu_uploads_on_restaurant_id"
    t.index ["review_id"], name: "index_menu_uploads_on_review_id"
  end

  create_table "orders", force: :cascade do |t|
    t.text "address", null: false
    t.integer "cart_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cart_id"], name: "index_orders_on_cart_id"
  end

  create_table "restaurant_uploads", force: :cascade do |t|
    t.integer "restaurant_id", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.integer "review_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_restaurant_uploads_on_restaurant_id"
    t.index ["review_id"], name: "index_restaurant_uploads_on_review_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name", null: false
    t.text "address", null: false
    t.text "phone_no", null: false
    t.string "email", null: false
    t.integer "category_id", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.decimal "table_price", null: false
    t.float "longitude"
    t.float "latitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_restaurants_on_category_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating", null: false
    t.text "feedback", null: false
    t.integer "user_id", null: false
    t.integer "restaurant_id", null: false
    t.boolean "approve", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_reviews_on_restaurant_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest"
    t.boolean "admin", default: false
    t.string "provider"
    t.string "uid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "book_tables", "restaurants"
  add_foreign_key "book_tables", "users"
  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "food_items"
  add_foreign_key "carts", "users"
  add_foreign_key "food_items", "restaurants"
  add_foreign_key "food_uploads", "restaurants"
  add_foreign_key "food_uploads", "reviews"
  add_foreign_key "menu_uploads", "restaurants"
  add_foreign_key "menu_uploads", "reviews"
  add_foreign_key "orders", "carts"
  add_foreign_key "restaurant_uploads", "restaurants"
  add_foreign_key "restaurant_uploads", "reviews"
  add_foreign_key "restaurants", "categories"
  add_foreign_key "reviews", "restaurants"
  add_foreign_key "reviews", "users"
end
