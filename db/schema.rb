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

ActiveRecord::Schema.define(version: 2021_03_11_235603) do

  create_table "children", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "子", force: :cascade do |t|
    t.integer "parent_id", comment: "親ID"
    t.string "child_no", limit: 12, comment: "子番号"
    t.string "child_name", limit: 64, null: false, comment: "子名"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["child_no"], name: "children_idx_01", unique: true
    t.index ["parent_id", "child_no"], name: "children_idx_02", unique: true
  end

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false, comment: "氏名"
    t.string "email", null: false, comment: "メールアドレス"
    t.string "tel", limit: 20, comment: "電話番号"
    t.string "address1", comment: "住所1"
    t.string "address2", comment: "住所2"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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

  create_table "permissions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false, comment: "権限名"
    t.string "en_name", null: false, comment: "権限名英字"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "product_consts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "商品", force: :cascade do |t|
    t.integer "const_id", null: false, comment: "コンスタントID"
    t.string "const_div", limit: 5, null: false, comment: "コンスタント区分"
    t.string "const_cd", limit: 20, null: false, comment: "コンスタントCD"
    t.string "const_cd_text", limit: 128, comment: "コンスタントCD内容"
    t.decimal "const_cd_value", precision: 11, scale: 3, comment: "コンスタントCD値"
    t.integer "sort_no", comment: "出力順"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["const_id"], name: "product_consts_idx_01", unique: true
  end

  create_table "product_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "商品詳細", force: :cascade do |t|
    t.bigint "product_id", null: false, comment: "商品ID"
    t.string "color", comment: "カラー"
    t.integer "size", default: 0, null: false, comment: "サイズ 0: サイズフリー / 1: S / 2: M /3: L / 4: XL"
    t.integer "season", default: 0, null: false, comment: "シーズン 0: シーズンレス / 1: 春 / 2: 夏 / 3: 秋 / 4: 冬"
    t.integer "product_country", default: 0, null: false, comment: "生産国 0:不明 / 00: アジア / 01: 北米 /02: 南米 / 03: 欧州 / 04: アフリカ"
    t.date "scheduled_arrive", comment: "入荷予定日"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_product_details_on_product_id"
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "商品", force: :cascade do |t|
    t.string "product_div", limit: 3, null: false, comment: "商品区分"
    t.string "item_cd", limit: 5, null: false, comment: "商品コード"
    t.string "product_cd", limit: 8, null: false, comment: "製品コード"
    t.string "name", null: false, comment: "商品名"
    t.integer "category", default: 0, null: false, comment: "カテゴリ 0: その他 / 1: アウター / 2: ボトムス / 3: シャツ / 4: カットソー / 5: ニット / 6: グッズ / 7: インナ-"
    t.integer "sex", null: false, comment: "性別 1: ユニセックス / 2: 女性 / 3: 男性"
    t.integer "status", default: 0, null: false, comment: "状態 0: 無効 / 1: 有効 / 2: セール価格 / 3: 売価変更 /　4: 終売"
    t.datetime "sale_start", comment: "販売開始日"
    t.datetime "sale_end", comment: "販売終了日"
    t.string "image", comment: "画像"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_cd"], name: "product_cds_idx_01", unique: true
  end

  create_table "roles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", comment: "ロール名"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "roles_permissions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "role_id", comment: "ロール"
    t.bigint "permission_id", comment: "権限"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["permission_id"], name: "index_roles_permissions_on_permission_id"
    t.index ["role_id"], name: "index_roles_permissions_on_role_id"
  end

  create_table "system_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "encrypted_password", default: "", null: false
    t.string "login_id", limit: 8
    t.string "name", default: "", null: false
    t.boolean "admin", default: true, null: false
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["login_id"], name: "index_system_users_on_login_id", unique: true
  end

  create_table "system_users_roles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "system_user_id", comment: "管理ユーザ"
    t.bigint "role_id", comment: "ロール"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_system_users_roles_on_role_id"
    t.index ["system_user_id"], name: "index_system_users_roles_on_system_user_id"
  end

  add_foreign_key "product_details", "products"
  add_foreign_key "roles_permissions", "permissions"
  add_foreign_key "roles_permissions", "roles"
  add_foreign_key "system_users_roles", "roles"
  add_foreign_key "system_users_roles", "system_users"
end
