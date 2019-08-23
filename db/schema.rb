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

ActiveRecord::Schema.define(version: 20190817074959) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "prefectures_id_id", null: false
    t.string  "city",              null: false
    t.string  "block",             null: false
    t.integer "users_id",          null: false
    t.index ["prefectures_id_id"], name: "index_addresses_on_prefectures_id_id", using: :btree
  end

  create_table "brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "customer_id", null: false
    t.string   "card_id",     null: false
    t.index ["user_id"], name: "index_cards_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "ancestry"
    t.index ["ancestry"], name: "index_categories_on_ancestry", using: :btree
  end

  create_table "category_sizes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "category_id"
    t.integer  "size_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["category_id"], name: "index_category_sizes_on_category_id", using: :btree
    t.index ["size_id"], name: "index_category_sizes_on_size_id", using: :btree
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "comment",    limit: 65535
    t.integer  "product_id",               null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["product_id"], name: "index_comments_on_product_id", using: :btree
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

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                             null: false
    t.text     "detail",             limit: 65535
    t.integer  "price",                            null: false
    t.integer  "user_id",                          null: false
    t.integer  "like"
    t.integer  "delivery_fee"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "status_id"
    t.integer  "brand_id"
    t.integer  "size_id"
    t.integer  "prefecture_id"
    t.string   "city"
    t.integer  "shipping_date_id"
    t.string   "date"
    t.integer  "category_id"
    t.integer  "charge_id"
    t.integer  "condition_id"
    t.integer  "delivery_method_id"
    t.integer  "shipment_id"
    t.index ["brand_id"], name: "index_products_on_brand_id", using: :btree
    t.index ["category_id"], name: "index_products_on_category_id", using: :btree
    t.index ["size_id"], name: "index_products_on_size_id", using: :btree
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
    t.integer  "card_id"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "size"
    t.string   "ancestry"
  end

  create_table "sns_credentials", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "name"
    t.string   "nickname"
    t.string   "email"
    t.string   "url"
    t.string   "image_url"
    t.string   "description"
    t.text     "other",       limit: 65535
    t.text     "credentials", limit: 65535
    t.text     "raw_info",    limit: 65535
    t.index ["provider", "uid"], name: "index_sns_credentials_on_provider_and_uid", unique: true, using: :btree
    t.index ["user_id"], name: "index_sns_credentials_on_user_id", using: :btree
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
    t.string   "last_name"
    t.string   "first_name"
    t.string   "last_name_kana"
    t.string   "first_name_kana"
    t.integer  "birthday"
    t.string   "tel"
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
  add_foreign_key "category_sizes", "categories"
  add_foreign_key "category_sizes", "sizes"
  add_foreign_key "comments", "products"
  add_foreign_key "favorites", "products"
  add_foreign_key "favorites", "users"
  add_foreign_key "images", "products"
  add_foreign_key "products", "brands"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "sizes"
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
  add_foreign_key "sns_credentials", "users"
  add_foreign_key "social_media", "users"
end
