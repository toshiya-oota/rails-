# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_29_063220) do

  create_table "children", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "子", force: :cascade do |t|
    t.integer "parent_id", comment: "親ID"
    t.string "child_no", limit: 12, comment: "子番号"
    t.string "child_name", limit: 64, null: false, comment: "子名"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["child_no"], name: "children_idx_01", unique: true
    t.index ["parent_id", "child_no"], name: "children_idx_02", unique: true
  end

  create_table "grand_children", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "孫", force: :cascade do |t|
    t.string "child_no", null: false, comment: "子番号"
    t.string "grand_child_name", limit: 64, null: false, comment: "孫名"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "parents", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "親", force: :cascade do |t|
    t.integer "parent_id", comment: "親ID"
    t.string "parent_no", limit: 12, comment: "親番号"
    t.string "parent_name", limit: 64, null: false, comment: "親名"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parent_id"], name: "parents_idx_01", unique: true
    t.index ["parent_no"], name: "parents_idx_02", unique: true
  end

end
