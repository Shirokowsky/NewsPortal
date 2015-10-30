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

ActiveRecord::Schema.define(version: 20151029191245) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.text     "text"
    t.boolean  "accepted",         default: false
    t.integer  "patternable_id"
    t.string   "patternable_type"
    t.integer  "categorable_id"
    t.string   "categorable_type"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "articles", ["categorable_type", "categorable_id"], name: "index_articles_on_categorable_type_and_categorable_id", using: :btree
  add_index "articles", ["patternable_type", "patternable_id"], name: "index_articles_on_patternable_type_and_patternable_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.integer  "category_links_count"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "category_links", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "categorable_id"
    t.string   "categorable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "category_links", ["categorable_type", "categorable_id"], name: "index_category_links_on_categorable_type_and_categorable_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "text"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "comments", ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "nickname"
    t.boolean  "admin"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["nickname"], name: "index_users_on_nickname", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
