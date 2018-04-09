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


ActiveRecord::Schema.define(version: 20180409002923) do



  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.date "from_date"
    t.date "to_date"
    t.integer "owner_rating"
    t.text "owner_comments"
    t.integer "rentor_rating"
    t.text "rentor_comments"
    t.boolean "rent_status"
    t.bigint "profile_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_bookings_on_product_id"
    t.index ["profile_id"], name: "index_bookings_on_profile_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "image"
    t.integer "price"
    t.string "category"
    t.date "start_availability"
    t.date "end_availability"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "password"
    t.text "phone"
    t.text "address"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "image"


    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
     t.index ["confirmation_token"], name: "index_profiles_on_confirmation_token", unique: true
    t.index ["email"], name: "index_profiles_on_email", unique: true
     # t.index ["reset_password_token"], name: "index_profiles_on_reset_password_token", unique: true

  end

  create_table "reviews", force: :cascade do |t|
    t.integer "booking_id"
    t.integer "product_id"
    t.integer "profile_id"
    t.text "description"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

   add_foreign_key "bookings", "products"
   add_foreign_key "bookings", "profiles"
   add_foreign_key "reviews" , "products"
end
