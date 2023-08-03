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

ActiveRecord::Schema[7.0].define(version: 2023_08_02_180252) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.bigint "state_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "head_social_aids", force: :cascade do |t|
    t.bigint "head_id", null: false
    t.bigint "social_aid_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["head_id"], name: "index_head_social_aids_on_head_id"
    t.index ["social_aid_id"], name: "index_head_social_aids_on_social_aid_id"
  end

  create_table "heads", force: :cascade do |t|
    t.string "cedula"
    t.string "name"
    t.string "sur_name"
    t.date "head_birthdate"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone_number"
    t.string "home_number"
    t.bigint "social_aid_id"
    t.boolean "disability"
    t.string "disability_types"
    t.index ["social_aid_id"], name: "index_heads_on_social_aid_id"
    t.index ["user_id"], name: "index_heads_on_user_id"
  end

  create_table "heads_social_aids", id: false, force: :cascade do |t|
    t.bigint "head_id", null: false
    t.bigint "social_aid_id", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "cedula"
    t.string "name"
    t.string "sur_name"
    t.date "member_birthdate"
    t.string "relationship"
    t.bigint "head_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone_number"
    t.boolean "member_disability"
    t.string "member_disability_types"
    t.index ["head_id"], name: "index_members_on_head_id"
  end

  create_table "members_social_aids", force: :cascade do |t|
    t.bigint "member_id"
    t.bigint "social_aid_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_members_social_aids_on_member_id"
    t.index ["social_aid_id"], name: "index_members_social_aids_on_social_aid_id"
  end

  create_table "social_aids", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "social_aids_heads", force: :cascade do |t|
    t.bigint "social_aid_id"
    t.bigint "head_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["head_id"], name: "index_social_aids_heads_on_head_id"
    t.index ["social_aid_id"], name: "index_social_aids_heads_on_social_aid_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "state_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "community"
    t.string "street"
    t.string "comuna"
    t.string "ubch"
    t.bigint "state_id"
    t.bigint "city_id"
    t.index ["city_id"], name: "index_users_on_city_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["state_id"], name: "index_users_on_state_id"
  end

  add_foreign_key "cities", "states"
  add_foreign_key "head_social_aids", "heads"
  add_foreign_key "head_social_aids", "social_aids"
  add_foreign_key "heads", "social_aids"
  add_foreign_key "heads", "users"
  add_foreign_key "members", "heads"
  add_foreign_key "social_aids_heads", "heads"
  add_foreign_key "users", "cities"
  add_foreign_key "users", "states"
end
