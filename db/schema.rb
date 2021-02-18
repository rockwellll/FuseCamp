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

ActiveRecord::Schema.define(version: 2021_02_16_054908) do

  create_table "accounts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "action_text_rich_texts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.text "body", size: :long
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "administratorships", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.bigint "person_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id", "person_id"], name: "index_administratorships_on_account_id_and_person_id", unique: true
    t.index ["account_id"], name: "index_administratorships_on_account_id"
    t.index ["person_id"], name: "index_administratorships_on_person_id"
  end

  create_table "boosts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "boostable_type", null: false
    t.bigint "boostable_id", null: false
    t.text "message", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["boostable_type", "boostable_id"], name: "index_boosts_on_boostable_type_and_boostable_id"
    t.index ["user_id", "boostable_id", "boostable_type"], name: "index_boosts_on_user_id_and_boostable_id_and_boostable_type", unique: true
    t.index ["user_id"], name: "index_boosts_on_user_id"
  end

  create_table "colors", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "hex", null: false
    t.string "colorable_type", null: false
    t.bigint "colorable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["colorable_type", "colorable_id"], name: "index_colors_on_colorable_type_and_colorable_id"
  end

  create_table "comments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "commentable_type"
    t.bigint "commentable_id"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "companies", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.bigint "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_companies_on_account_id"
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "people", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "job_title"
    t.bigint "user_id", null: false
    t.bigint "company_id"
    t.bigint "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_people_on_account_id"
    t.index ["company_id"], name: "index_people_on_company_id"
    t.index ["user_id"], name: "index_people_on_user_id"
  end

  create_table "people_projects", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.bigint "project_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id", "project_id"], name: "index_people_projects_on_person_id_and_project_id", unique: true
    t.index ["person_id"], name: "index_people_projects_on_person_id"
    t.index ["project_id"], name: "index_people_projects_on_project_id"
  end

  create_table "projects", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_projects_on_account_id"
  end

  create_table "t1s", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "todo_sets", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "creator_id", null: false
    t.bigint "project_id", null: false
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "deleted_at"
    t.bigint "parent_id"
    t.index ["creator_id"], name: "index_todo_sets_on_creator_id"
    t.index ["parent_id"], name: "index_todo_sets_on_parent_id"
    t.index ["project_id"], name: "index_todo_sets_on_project_id"
  end

  create_table "todos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "todo_set_id", null: false
    t.string "name", null: false
    t.boolean "status", default: false
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.datetime "deadline"
    t.text "notes"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["todo_set_id"], name: "index_todos_on_todo_set_id"
    t.index ["user_id"], name: "index_todos_on_user_id"
  end

  create_table "trash_items", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "trash_id", null: false
    t.string "trashable_type"
    t.bigint "trashable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trash_id"], name: "index_trash_items_on_trash_id"
    t.index ["trashable_type", "trashable_id"], name: "index_trash_items_on_trashable_type_and_trashable_id"
  end

  create_table "trashes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_trashes_on_project_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_member", null: false
    t.text "name"
    t.text "provider"
    t.text "uid"
    t.text "image"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "administratorships", "accounts"
  add_foreign_key "administratorships", "people"
  add_foreign_key "boosts", "users"
  add_foreign_key "comments", "users"
  add_foreign_key "companies", "accounts"
  add_foreign_key "companies", "users"
  add_foreign_key "people", "accounts"
  add_foreign_key "people", "companies"
  add_foreign_key "people", "users"
  add_foreign_key "people_projects", "people"
  add_foreign_key "people_projects", "projects"
  add_foreign_key "projects", "accounts"
  add_foreign_key "todo_sets", "projects"
  add_foreign_key "todo_sets", "todo_sets", column: "parent_id"
  add_foreign_key "todo_sets", "users", column: "creator_id"
  add_foreign_key "todos", "todo_sets"
  add_foreign_key "todos", "users"
  add_foreign_key "trash_items", "trashes"
  add_foreign_key "trashes", "projects"
end
