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

ActiveRecord::Schema.define(version: 20150316223307) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attribute_types", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "brands", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "service_id"
    t.string   "service_slug"
  end

  create_table "microposts", force: :cascade do |t|
    t.string   "content",    limit: 255
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at", using: :btree

  create_table "nifty_attachments", force: :cascade do |t|
    t.integer  "parent_id"
    t.string   "parent_type", limit: 255
    t.string   "token",       limit: 255
    t.string   "digest",      limit: 255
    t.string   "role",        limit: 255
    t.string   "file_name",   limit: 255
    t.string   "file_type",   limit: 255
    t.binary   "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nifty_key_value_store", force: :cascade do |t|
    t.integer "parent_id"
    t.string  "parent_type", limit: 255
    t.string  "group",       limit: 255
    t.string  "name",        limit: 255
    t.string  "value",       limit: 255
  end

  create_table "product_attributes", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "user_attribute_id"
    t.string   "value",             limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "product_categories", force: :cascade do |t|
    t.string   "title",          limit: 255
    t.string   "description",    limit: 2000
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.integer  "children_count",              default: 0
    t.integer  "service_id"
    t.string   "service_slug",   limit: 255
  end

  add_index "product_categories", ["depth"], name: "depth_ind", using: :btree
  add_index "product_categories", ["lft"], name: "lft_ind", using: :btree
  add_index "product_categories", ["parent_id"], name: "parent_id_ind", using: :btree
  add_index "product_categories", ["rgt"], name: "rgt_ind", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "title",               limit: 255
    t.integer  "product_category_id"
    t.string   "sku",                 limit: 255
    t.string   "description",         limit: 2000
    t.string   "short_description",   limit: 255
    t.boolean  "active"
    t.decimal  "price",                            precision: 10, scale: 2
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
    t.integer  "min_order"
    t.string   "image",               limit: 255
    t.string   "image_content_type",  limit: 255
    t.string   "image_file_name",     limit: 255
    t.string   "image_updated_at",    limit: 255
    t.integer  "image_file_size"
    t.integer  "rating"
    t.integer  "votes"
    t.integer  "user_id"
    t.string   "choco_id",            limit: 255
    t.string   "service",             limit: 255
    t.string   "help_image",          limit: 255
    t.integer  "brand_id"
    t.integer  "service_id"
  end

  add_index "products", ["choco_id"], name: "products_choco_id_key", unique: true, using: :btree

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id", using: :btree

  create_table "services", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "service_slug"
  end

  create_table "shoppe_countries", force: :cascade do |t|
    t.string  "name",      limit: 255
    t.string  "code2",     limit: 255
    t.string  "code3",     limit: 255
    t.string  "continent", limit: 255
    t.string  "tld",       limit: 255
    t.string  "currency",  limit: 255
    t.boolean "eu_member",             default: false
  end

  create_table "shoppe_delivery_service_prices", force: :cascade do |t|
    t.integer  "delivery_service_id"
    t.string   "code",                limit: 255
    t.decimal  "price",                           precision: 8, scale: 2
    t.decimal  "cost_price",                      precision: 8, scale: 2
    t.integer  "tax_rate_id"
    t.decimal  "min_weight",                      precision: 8, scale: 2
    t.decimal  "max_weight",                      precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "country_ids"
  end

  create_table "shoppe_delivery_services", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "code",         limit: 255
    t.boolean  "default",                  default: false
    t.boolean  "active",                   default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "courier",      limit: 255
    t.string   "tracking_url", limit: 255
  end

  create_table "shoppe_order_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "ordered_item_id"
    t.string   "ordered_item_type", limit: 255
    t.integer  "quantity",                                              default: 1
    t.decimal  "unit_price",                    precision: 8, scale: 2
    t.decimal  "unit_cost_price",               precision: 8, scale: 2
    t.decimal  "tax_amount",                    precision: 8, scale: 2
    t.decimal  "tax_rate",                      precision: 8, scale: 2
    t.decimal  "weight",                        precision: 8, scale: 3
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shoppe_orders", force: :cascade do |t|
    t.string   "token",                     limit: 255
    t.string   "first_name",                limit: 255
    t.string   "last_name",                 limit: 255
    t.string   "company",                   limit: 255
    t.string   "billing_address1",          limit: 255
    t.string   "billing_address2",          limit: 255
    t.string   "billing_address3",          limit: 255
    t.string   "billing_address4",          limit: 255
    t.string   "billing_postcode",          limit: 255
    t.integer  "billing_country_id"
    t.string   "email_address",             limit: 255
    t.string   "phone_number",              limit: 255
    t.string   "status",                    limit: 255
    t.datetime "received_at"
    t.datetime "accepted_at"
    t.datetime "shipped_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "delivery_service_id"
    t.decimal  "delivery_price",                        precision: 8, scale: 2
    t.decimal  "delivery_cost_price",                   precision: 8, scale: 2
    t.decimal  "delivery_tax_rate",                     precision: 8, scale: 2
    t.decimal  "delivery_tax_amount",                   precision: 8, scale: 2
    t.integer  "accepted_by"
    t.integer  "shipped_by"
    t.string   "consignment_number",        limit: 255
    t.datetime "rejected_at"
    t.integer  "rejected_by"
    t.string   "ip_address",                limit: 255
    t.text     "notes"
    t.boolean  "separate_delivery_address",                                     default: false
    t.string   "delivery_name",             limit: 255
    t.string   "delivery_address1",         limit: 255
    t.string   "delivery_address2",         limit: 255
    t.string   "delivery_address3",         limit: 255
    t.string   "delivery_address4",         limit: 255
    t.string   "delivery_postcode",         limit: 255
    t.integer  "delivery_country_id"
    t.decimal  "amount_paid",                           precision: 8, scale: 2, default: 0.0
    t.boolean  "exported",                                                      default: false
    t.string   "invoice_number",            limit: 255
  end

  create_table "shoppe_payments", force: :cascade do |t|
    t.integer  "order_id"
    t.decimal  "amount",                        precision: 8, scale: 2, default: 0.0
    t.string   "reference",         limit: 255
    t.string   "method",            limit: 255
    t.boolean  "confirmed",                                             default: true
    t.boolean  "refundable",                                            default: false
    t.decimal  "amount_refunded",               precision: 8, scale: 2, default: 0.0
    t.integer  "parent_payment_id"
    t.boolean  "exported",                                              default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shoppe_product_attributes", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "key",        limit: 255
    t.string   "value",      limit: 255
    t.integer  "position",               default: 1
    t.boolean  "searchable",             default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "public",                 default: true
  end

  create_table "shoppe_product_categories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "permalink",   limit: 255
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shoppe_products", force: :cascade do |t|
    t.integer  "parent_id"
    t.integer  "product_category_id"
    t.string   "name",                limit: 255
    t.string   "sku",                 limit: 255
    t.string   "permalink",           limit: 255
    t.text     "description"
    t.text     "short_description"
    t.boolean  "active",                                                  default: true
    t.decimal  "weight",                          precision: 8, scale: 3, default: 0.0
    t.decimal  "price",                           precision: 8, scale: 2, default: 0.0
    t.decimal  "cost_price",                      precision: 8, scale: 2, default: 0.0
    t.integer  "tax_rate_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "featured",                                                default: false
    t.text     "in_the_box"
    t.boolean  "stock_control",                                           default: true
    t.boolean  "default",                                                 default: false
  end

  create_table "shoppe_settings", force: :cascade do |t|
    t.string "key",        limit: 255
    t.string "value",      limit: 255
    t.string "value_type", limit: 255
  end

  create_table "shoppe_stock_level_adjustments", force: :cascade do |t|
    t.integer  "item_id"
    t.string   "item_type",   limit: 255
    t.string   "description", limit: 255
    t.integer  "adjustment",              default: 0
    t.string   "parent_type", limit: 255
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shoppe_tax_rates", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.decimal  "rate",                     precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "country_ids"
    t.string   "address_type", limit: 255
  end

  create_table "shoppe_users", force: :cascade do |t|
    t.string   "first_name",      limit: 255
    t.string   "last_name",       limit: 255
    t.string   "email_address",   limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tbl_pro_session", force: :cascade do |t|
    t.integer  "expire"
    t.binary   "data"
    t.integer  "user_id",                   null: false
    t.datetime "last_activity",             null: false
    t.string   "last_ip",       limit: 255, null: false
  end

  create_table "tovars", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "article",    limit: 255
    t.string   "comment",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.boolean  "hidden"
  end

  create_table "user_attributes", force: :cascade do |t|
    t.string   "title",             limit: 255
    t.integer  "user_id"
    t.integer  "attribute_type_id"
    t.text     "parameter"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                      limit: 255
    t.string   "email",                     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest",           limit: 255
    t.string   "remember_token",            limit: 255
    t.boolean  "admin"
    t.decimal  "rating",                                precision: 10, scale: 2, default: 10.0
    t.integer  "b_type",                    limit: 2
    t.integer  "votes"
    t.string   "country",                   limit: 255
    t.string   "company_status",            limit: 255
    t.string   "company_logo",              limit: 255
    t.string   "company_logo_content_type", limit: 255
    t.string   "company_logo_file_name",    limit: 255
    t.string   "company_logo_updated_at",   limit: 255
    t.integer  "company_logo_file_size"
    t.string   "image_content_type",        limit: 255
    t.string   "image",                     limit: 255
    t.string   "image_file_name",           limit: 255
    t.string   "image_updated_at",          limit: 255
    t.integer  "image_file_size"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

