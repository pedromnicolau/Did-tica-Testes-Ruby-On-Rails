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

ActiveRecord::Schema[8.0].define(version: 2025_10_27_221526) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "deals", force: :cascade do |t|
    t.bigint "property_id", null: false
    t.bigint "lead_id", null: false
    t.integer "price_cents"
    t.datetime "signed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lead_id"], name: "index_deals_on_lead_id"
    t.index ["property_id"], name: "index_deals_on_property_id"
  end

  create_table "leads", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.bigint "property_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_leads_on_property_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string "title"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.integer "price_cents"
    t.integer "status"
    t.bigint "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_properties_on_owner_id"
  end

  create_table "visits", force: :cascade do |t|
    t.bigint "property_id", null: false
    t.bigint "lead_id", null: false
    t.datetime "scheduled_at"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lead_id"], name: "index_visits_on_lead_id"
    t.index ["property_id"], name: "index_visits_on_property_id"
  end

  add_foreign_key "deals", "leads"
  add_foreign_key "deals", "properties"
  add_foreign_key "leads", "properties"
  add_foreign_key "properties", "owners"
  add_foreign_key "visits", "leads"
  add_foreign_key "visits", "properties"
end
