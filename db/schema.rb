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

ActiveRecord::Schema[7.0].define(version: 2023_06_11_232118) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bids", force: :cascade do |t|
    t.integer "price"
    t.text "status"
    t.boolean "expiration"
    t.bigint "move_id", null: false
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_bids_on_company_id"
    t.index ["move_id"], name: "index_bids_on_move_id"
  end

  create_table "chatrooms", force: :cascade do |t|
    t.string "status"
    t.bigint "company_id", null: false
    t.bigint "client_id", null: false
    t.bigint "message_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_chatrooms_on_client_id"
    t.index ["company_id"], name: "index_chatrooms_on_company_id"
    t.index ["message_id"], name: "index_chatrooms_on_message_id"
  end

  create_table "clients", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.text "address"
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "moves", force: :cascade do |t|
    t.datetime "date"
    t.string "start_point"
    t.string "end_point"
    t.text "shipment_info"
    t.string "status"
    t.boolean "expiration"
    t.bigint "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["client_id"], name: "index_moves_on_client_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "company_id", null: false
    t.integer "efficiency_rating"
    t.integer "punctuality_rating"
    t.integer "politeness_rating"
    t.string "image"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_reviews_on_client_id"
    t.index ["company_id"], name: "index_reviews_on_company_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.string "profile_pic"
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bids", "companies"
  add_foreign_key "bids", "moves"
  add_foreign_key "chatrooms", "clients"
  add_foreign_key "chatrooms", "companies"
  add_foreign_key "chatrooms", "messages"
  add_foreign_key "clients", "users"
  add_foreign_key "companies", "users"
  add_foreign_key "moves", "clients"
  add_foreign_key "reviews", "clients"
  add_foreign_key "reviews", "companies"
end
