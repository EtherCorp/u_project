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

ActiveRecord::Schema.define(version: 20171106024938) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accesses", force: :cascade do |t|
    t.string "access_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "accesses_permissions", id: false, force: :cascade do |t|
    t.bigint "access_id", null: false
    t.bigint "permission_id", null: false
    t.index ["access_id"], name: "index_accesses_permissions_on_access_id"
    t.index ["permission_id"], name: "index_accesses_permissions_on_permission_id"
  end

  create_table "connection_tokens", force: :cascade do |t|
    t.bigint "medical_center_id"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true, null: false
    t.string "driver", null: false
    t.index ["medical_center_id"], name: "index_connection_tokens_on_medical_center_id"
  end

  create_table "consults", force: :cascade do |t|
    t.bigint "patient_id"
    t.bigint "professional_id"
    t.datetime "date", null: false
    t.string "reason"
    t.string "symptoms"
    t.string "observations"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_consults_on_patient_id"
    t.index ["professional_id"], name: "index_consults_on_professional_id"
  end

  create_table "documents", force: :cascade do |t|
    t.bigint "movement_id"
    t.integer "doc_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movement_id"], name: "index_documents_on_movement_id"
  end

  create_table "measurements", force: :cascade do |t|
    t.bigint "metric_id"
    t.string "value", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["metric_id"], name: "index_measurements_on_metric_id"
  end

  create_table "medical_centers", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medical_centers_professionals", id: false, force: :cascade do |t|
    t.bigint "medical_center_id", null: false
    t.bigint "professional_id", null: false
    t.index ["medical_center_id"], name: "index_medical_centers_professionals_on_medical_center_id"
    t.index ["professional_id"], name: "index_medical_centers_professionals_on_professional_id"
  end

  create_table "metrics", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movement_details", force: :cascade do |t|
    t.bigint "movement_id"
    t.string "key", null: false
    t.string "value", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movement_id"], name: "index_movement_details_on_movement_id"
  end

  create_table "movements", force: :cascade do |t|
    t.bigint "consult_id"
    t.string "movement_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["consult_id"], name: "index_movements_on_consult_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "rut", null: false
    t.string "name", null: false
    t.string "last_name", null: false
    t.integer "age", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rut"], name: "index_patients_on_rut", unique: true
  end

  create_table "permissions", force: :cascade do |t|
    t.bigint "patient_id"
    t.bigint "professional_id"
    t.date "date", null: false
    t.date "expiration", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_permissions_on_patient_id"
    t.index ["professional_id"], name: "index_permissions_on_professional_id"
  end

  create_table "professionals", force: :cascade do |t|
    t.string "rut", null: false
    t.string "name", null: false
    t.string "last_name", null: false
    t.integer "age", null: false
    t.string "nationality", null: false
    t.string "job_title", null: false
    t.date "grant_date", null: false
    t.string "granting_entity", null: false
    t.bigint "speciality_id"
    t.string "registration_number", null: false
    t.date "registration_date", null: false
    t.boolean "freelance", default: false
    t.string "email", null: false
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rut"], name: "index_professionals_on_rut", unique: true
    t.index ["speciality_id"], name: "index_professionals_on_speciality_id"
  end

  create_table "specialities", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_specialities_on_name", unique: true
  end

end
