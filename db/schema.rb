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

ActiveRecord::Schema[7.0].define(version: 2023_10_27_152346) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blances", force: :cascade do |t|
    t.date "date", null: false
    t.string "category", limit: 100
    t.string "name", limit: 1000
    t.integer "investment_money"
    t.integer "recovery_money"
    t.integer "investment_saving"
    t.integer "recovery_saving"
    t.float "rate"
    t.string "store", limit: 1000
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
