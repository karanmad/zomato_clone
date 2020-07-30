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

ActiveRecord::Schema.define(version: 2020_07_27_114304) do

  create_table "book_tables", force: :cascade do |t|
    t.date "date"
    t.time "time"
    t.integer "heads"
    t.integer "user_id", null: false
    t.integer "restaurant_id", null: false 
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_book_tables_on_restaurant_id"
    t.index ["user_id"], name: "index_book_tables_on_user_id"
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "quantity"
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

  create_table "food_items", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
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
    t.text "address"
    t.integer "cart_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cart_id"], name: "index_orders_on_cart_id"
  end

  create_table "restaurant_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
    t.string "restaurant_name"
    t.text "address"
    t.text "phone_no"
    t.string "email"
    t.integer "restaurant_category_id"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.decimal "table_price"
    t.float "longitude"
    t.float "latitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "feedback"
    t.integer "user_id", null: false
    t.integer "restaurant_id", null: false
    t.boolean "approve", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_reviews_on_restaurant_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "Username"
    t.string "email"
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
  add_foreign_key "reviews", "restaurants"
  add_foreign_key "reviews", "users"
end
