# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150514165438) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "column_matches", force: true do |t|
    t.string   "model_columns"
    t.string   "access_columns"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dataset_formats", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "legacy_id"
  end

  create_table "dataset_scopes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "datasets", force: true do |t|
    t.integer  "programme_id"
    t.integer  "metadata_author_id"
    t.integer  "network_location_id"
    t.integer  "format_id"
    t.integer  "contact_point_id"
    t.integer  "source_id"
    t.integer  "license_id"
    t.integer  "use_level_id"
    t.integer  "importance_level_id"
    t.integer  "scope_id"
    t.integer  "legacy_id"
    t.date     "metadata_date"
    t.string   "metadata_dataset_id"
    t.string   "name"
    t.text     "abstract"
    t.string   "other_spatial_type"
    t.string   "ancillary_information"
    t.text     "specified_permission"
    t.boolean  "commercial_use"
    t.boolean  "priority"
    t.string   "priority_reasons"
    t.boolean  "duplication_risk"
    t.text     "additional_comments"
    t.boolean  "audit_status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "drives", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "importance_levels", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "legacy_id"
  end

  create_table "licenses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "legacy_id"
  end

  create_table "network_locations", force: true do |t|
    t.string   "path"
    t.integer  "drive_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programmes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "legacy_id"
    t.string   "code"
  end

  create_table "sources", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "legacy_id"
  end

  create_table "use_levels", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "legacy_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.integer  "programme_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
