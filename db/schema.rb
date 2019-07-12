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

ActiveRecord::Schema.define(version: 20190707115303) do

  create_table "brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cards_on_user_id", using: :btree
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "comment",    limit: 65535
    t.integer  "product_id",               null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["product_id"], name: "index_comments_on_product_id", using: :btree
  end

  create_table "conditions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "conditions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delivery_methods", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "product_id", null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_favorites_on_product_id", using: :btree
    t.index ["user_id"], name: "index_favorites_on_user_id", using: :btree
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "image"
    t.integer  "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_images_on_product_id", using: :btree
  end

  create_table "lar_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mid_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                             null: false
    t.text     "detail",             limit: 65535
    t.integer  "price",                            null: false
    t.integer  "user_id",                          null: false
    t.integer  "like"
    t.integer  "delivery_fee"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "condition_id"
    t.integer  "status_id"
    t.integer  "brand_id"
    t.integer  "lar_category_id"
    t.integer  "mid_category_id"
    t.integer  "sml_category_id"
    t.integer  "size_id"
    t.integer  "delivery_method_id"
    t.integer  "prefecture_id"
    t.string   "city"
    t.index ["brand_id"], name: "index_products_on_brand_id", using: :btree
    t.index ["condition_id"], name: "index_products_on_condition_id", using: :btree
    t.index ["delivery_method_id"], name: "index_products_on_delivery_method_id", using: :btree
    t.index ["lar_category_id"], name: "index_products_on_lar_category_id", using: :btree
    t.index ["mid_category_id"], name: "index_products_on_mid_category_id", using: :btree
    t.index ["size_id"], name: "index_products_on_size_id", using: :btree
    t.index ["sml_category_id"], name: "index_products_on_sml_category_id", using: :btree
    t.index ["status_id"], name: "index_products_on_status_id", using: :btree
    t.index ["user_id"], name: "index_products_on_user_id", using: :btree
  end

  create_table "profiles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "introduce",  limit: 65535
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "purchases", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "payment",        null: false
    t.string   "payment_method"
    t.integer  "product_id",     null: false
    t.integer  "seller_id"
    t.integer  "buyer_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "address_id"
    t.integer  "card_id"
    t.index ["address_id"], name: "index_purchases_on_address_id", using: :btree
    t.index ["buyer_id"], name: "index_purchases_on_buyer_id", using: :btree
    t.index ["card_id"], name: "index_purchases_on_card_id", using: :btree
    t.index ["product_id"], name: "index_purchases_on_product_id", using: :btree
    t.index ["seller_id"], name: "index_purchases_on_seller_id", using: :btree
  end

  create_table "ratings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "rating"
    t.text     "review",      limit: 65535
    t.integer  "seller_id"
    t.integer  "buyer_id"
    t.integer  "purchase_id",               null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["buyer_id"], name: "index_ratings_on_buyer_id", using: :btree
    t.index ["purchase_id"], name: "index_ratings_on_purchase_id", using: :btree
    t.index ["seller_id"], name: "index_ratings_on_seller_id", using: :btree
  end

  create_table "sizes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "clothe"
    t.string   "mens_shoes"
    t.string   "ladies_shoes"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "sml_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "social_media", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_social_media_on_user_id", using: :btree
  end

  create_table "statuses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nickname",                            null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "last_name",                           null: false
    t.string   "first_name",                          null: false
    t.string   "last_name_kana",                      null: false
    t.string   "first_name_kana",                     null: false
    t.integer  "birthday",                            null: false
    t.integer  "tel",                                 null: false
    t.string   "avatar"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "cards", "users"
  add_foreign_key "comments", "products"
  add_foreign_key "favorites", "products"
  add_foreign_key "favorites", "users"
  add_foreign_key "images", "products"
  add_foreign_key "products", "brands"
  add_foreign_key "products", "conditions"
  add_foreign_key "products", "delivery_methods"
  add_foreign_key "products", "lar_categories"
  add_foreign_key "products", "mid_categories"
  add_foreign_key "products", "sizes"
  add_foreign_key "products", "sml_categories"
  add_foreign_key "products", "statuses"
  add_foreign_key "products", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "purchases", "cards"
  add_foreign_key "purchases", "products"
  add_foreign_key "purchases", "users", column: "buyer_id"
  add_foreign_key "purchases", "users", column: "seller_id"
  add_foreign_key "ratings", "purchases"
  add_foreign_key "ratings", "users", column: "buyer_id"
  add_foreign_key "ratings", "users", column: "seller_id"
  add_foreign_key "social_media", "users"
end
