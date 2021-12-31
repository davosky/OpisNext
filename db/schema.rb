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

ActiveRecord::Schema.define(version: 25) do

  create_table "active_storage_attachments", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "categories", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "company_typologies", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "generic_offices", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "generic_practises", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "generic_subscriptions", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "generic_office_id", null: false
    t.bigint "subscription_typology_id", null: false
    t.string "customer_name"
    t.string "customer_forname"
    t.bigint "sex_id", null: false
    t.string "customer_birth_place"
    t.date "customer_birth_date"
    t.string "customer_fiscal_code"
    t.string "customer_nationality"
    t.string "customer_address"
    t.string "customer_zip"
    t.string "customer_city"
    t.string "customer_province"
    t.string "customer_phone"
    t.string "customer_mobile"
    t.string "customer_email"
    t.string "company_vat_number"
    t.string "company_fiscal_code"
    t.string "company_name"
    t.string "company_address"
    t.string "company_zip"
    t.string "company_city"
    t.string "company_province"
    t.bigint "company_typology_id"
    t.bigint "work_qualify_id"
    t.bigint "work_level_id"
    t.string "work_contract"
    t.bigint "work_worker_id"
    t.date "work_employee_date"
    t.string "work_workplace"
    t.decimal "payment", precision: 8, scale: 2, default: "0.0"
    t.bigint "payment_typology_id", null: false
    t.bigint "category_id", null: false
    t.bigint "subscription_year_id", null: false
    t.bigint "generic_practise_id", null: false
    t.bigint "privacy_one_id", null: false
    t.bigint "privacy_two_id", null: false
    t.bigint "privacy_three_id", null: false
    t.text "note"
    t.boolean "cancellation"
    t.string "cancellation_reason"
    t.integer "name"
    t.date "date"
    t.string "institute"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_generic_subscriptions_on_category_id"
    t.index ["company_typology_id"], name: "index_generic_subscriptions_on_company_typology_id"
    t.index ["generic_office_id"], name: "index_generic_subscriptions_on_generic_office_id"
    t.index ["generic_practise_id"], name: "index_generic_subscriptions_on_generic_practise_id"
    t.index ["payment_typology_id"], name: "index_generic_subscriptions_on_payment_typology_id"
    t.index ["privacy_one_id"], name: "index_generic_subscriptions_on_privacy_one_id"
    t.index ["privacy_three_id"], name: "index_generic_subscriptions_on_privacy_three_id"
    t.index ["privacy_two_id"], name: "index_generic_subscriptions_on_privacy_two_id"
    t.index ["sex_id"], name: "index_generic_subscriptions_on_sex_id"
    t.index ["subscription_typology_id"], name: "index_generic_subscriptions_on_subscription_typology_id"
    t.index ["subscription_year_id"], name: "index_generic_subscriptions_on_subscription_year_id"
    t.index ["user_id"], name: "index_generic_subscriptions_on_user_id"
    t.index ["work_level_id"], name: "index_generic_subscriptions_on_work_level_id"
    t.index ["work_qualify_id"], name: "index_generic_subscriptions_on_work_qualify_id"
    t.index ["work_worker_id"], name: "index_generic_subscriptions_on_work_worker_id"
  end

  create_table "howtos", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "title"
    t.string "topic"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "inca_offices", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "inca_practises", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "inca_receipts", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "inca_office_id", null: false
    t.string "customer_name"
    t.string "customer_forname"
    t.string "customer_birth_place"
    t.date "customer_birth_date"
    t.string "customer_fiscal_code"
    t.string "customer_address"
    t.string "customer_zip"
    t.string "customer_city"
    t.string "customer_province"
    t.decimal "payment", precision: 8, scale: 2, default: "0.0"
    t.bigint "payment_typology_id", null: false
    t.text "note"
    t.integer "name"
    t.date "date"
    t.bigint "user_id", null: false
    t.string "institute"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "cancellation"
    t.string "cancellation_reason"
    t.index ["inca_office_id"], name: "index_inca_receipts_on_inca_office_id"
    t.index ["payment_typology_id"], name: "index_inca_receipts_on_payment_typology_id"
    t.index ["user_id"], name: "index_inca_receipts_on_user_id"
  end

  create_table "inca_subscriptions", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "name"
    t.text "note"
    t.boolean "cancellation"
    t.string "cancellation_reason"
    t.date "date"
    t.string "institute"
    t.string "customer_name"
    t.string "customer_forname"
    t.string "customer_birth_place"
    t.date "customer_birth_date"
    t.string "customer_fiscal_code"
    t.string "customer_nationality"
    t.string "customer_address"
    t.string "customer_zip"
    t.string "customer_city"
    t.string "customer_province"
    t.string "customer_phone"
    t.string "customer_mobile"
    t.string "customer_email"
    t.string "company_vat_number"
    t.string "company_fiscal_code"
    t.string "company_name"
    t.string "company_address"
    t.string "company_zip"
    t.string "company_city"
    t.string "company_province"
    t.string "work_contract"
    t.date "work_employee_date"
    t.string "work_workplace"
    t.decimal "payment", precision: 8, scale: 2, default: "0.0"
    t.bigint "inca_office_id", null: false
    t.bigint "subscription_typology_id", null: false
    t.bigint "sex_id", null: false
    t.bigint "user_id", null: false
    t.bigint "company_typology_id"
    t.bigint "work_qualify_id"
    t.bigint "work_level_id"
    t.bigint "work_worker_id"
    t.bigint "payment_typology_id", null: false
    t.bigint "category_id", null: false
    t.bigint "subscription_year_id", null: false
    t.bigint "inca_practise_id", null: false
    t.bigint "privacy_one_id", null: false
    t.bigint "privacy_two_id", null: false
    t.bigint "privacy_three_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_inca_subscriptions_on_category_id"
    t.index ["company_typology_id"], name: "index_inca_subscriptions_on_company_typology_id"
    t.index ["inca_office_id"], name: "index_inca_subscriptions_on_inca_office_id"
    t.index ["inca_practise_id"], name: "index_inca_subscriptions_on_inca_practise_id"
    t.index ["payment_typology_id"], name: "index_inca_subscriptions_on_payment_typology_id"
    t.index ["privacy_one_id"], name: "index_inca_subscriptions_on_privacy_one_id"
    t.index ["privacy_three_id"], name: "index_inca_subscriptions_on_privacy_three_id"
    t.index ["privacy_two_id"], name: "index_inca_subscriptions_on_privacy_two_id"
    t.index ["sex_id"], name: "index_inca_subscriptions_on_sex_id"
    t.index ["subscription_typology_id"], name: "index_inca_subscriptions_on_subscription_typology_id"
    t.index ["subscription_year_id"], name: "index_inca_subscriptions_on_subscription_year_id"
    t.index ["user_id"], name: "index_inca_subscriptions_on_user_id"
    t.index ["work_level_id"], name: "index_inca_subscriptions_on_work_level_id"
    t.index ["work_qualify_id"], name: "index_inca_subscriptions_on_work_qualify_id"
    t.index ["work_worker_id"], name: "index_inca_subscriptions_on_work_worker_id"
  end

  create_table "payment_typologies", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "privacy_ones", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "privacy_threes", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "privacy_twos", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sexes", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "subscription_typologies", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "subscription_years", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tariffs", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "name"
    t.bigint "category_id", null: false
    t.integer "position"
    t.string "typology"
    t.decimal "amount", precision: 8, scale: 2, default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_tariffs_on_category_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "admin", default: false
    t.boolean "manager", default: false
    t.boolean "regular", default: true
    t.string "name"
    t.string "address"
    t.string "mobile"
    t.string "pec"
    t.string "institute"
    t.string "office"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "work_levels", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "work_qualifies", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "work_workers", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "generic_subscriptions", "categories"
  add_foreign_key "generic_subscriptions", "company_typologies"
  add_foreign_key "generic_subscriptions", "generic_offices"
  add_foreign_key "generic_subscriptions", "generic_practises"
  add_foreign_key "generic_subscriptions", "payment_typologies"
  add_foreign_key "generic_subscriptions", "privacy_ones"
  add_foreign_key "generic_subscriptions", "privacy_threes"
  add_foreign_key "generic_subscriptions", "privacy_twos"
  add_foreign_key "generic_subscriptions", "sexes"
  add_foreign_key "generic_subscriptions", "subscription_typologies"
  add_foreign_key "generic_subscriptions", "subscription_years"
  add_foreign_key "generic_subscriptions", "users"
  add_foreign_key "generic_subscriptions", "work_levels"
  add_foreign_key "generic_subscriptions", "work_qualifies"
  add_foreign_key "generic_subscriptions", "work_workers"
  add_foreign_key "inca_receipts", "inca_offices"
  add_foreign_key "inca_receipts", "payment_typologies"
  add_foreign_key "inca_receipts", "users"
  add_foreign_key "inca_subscriptions", "categories"
  add_foreign_key "inca_subscriptions", "company_typologies"
  add_foreign_key "inca_subscriptions", "inca_offices"
  add_foreign_key "inca_subscriptions", "inca_practises"
  add_foreign_key "inca_subscriptions", "payment_typologies"
  add_foreign_key "inca_subscriptions", "privacy_ones"
  add_foreign_key "inca_subscriptions", "privacy_threes"
  add_foreign_key "inca_subscriptions", "privacy_twos"
  add_foreign_key "inca_subscriptions", "sexes"
  add_foreign_key "inca_subscriptions", "subscription_typologies"
  add_foreign_key "inca_subscriptions", "subscription_years"
  add_foreign_key "inca_subscriptions", "users"
  add_foreign_key "inca_subscriptions", "work_levels"
  add_foreign_key "inca_subscriptions", "work_qualifies"
  add_foreign_key "inca_subscriptions", "work_workers"
  add_foreign_key "tariffs", "categories"
end
