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

ActiveRecord::Schema[7.0].define(version: 2023_11_25_144318) do
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

  create_table "histories", force: :cascade do |t|
    t.integer "game_count", null: false
    t.string "chance", limit: 100, null: false
    t.string "investment", limit: 100, null: false
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "blance_id", null: false
    t.index ["blance_id"], name: "index_histories_on_blance_id"
  end

  create_table "history_orders", force: :cascade do |t|
    t.string "order", limit: 1000
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "blance_id", null: false
    t.index ["blance_id"], name: "index_history_orders_on_blance_id"
  end

  add_foreign_key "histories", "blances"
  add_foreign_key "history_orders", "blances"
end
