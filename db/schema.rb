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

ActiveRecord::Schema.define(version: 2018_08_07_024628) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "newsletters", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "sent_at"
    t.bigint "list_id"
    t.bigint "sender_id"
    t.bigint "template_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id"], name: "index_newsletters_on_list_id"
    t.index ["sender_id"], name: "index_newsletters_on_sender_id"
    t.index ["template_id"], name: "index_newsletters_on_template_id"
  end

  create_table "recipient_lists", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_recipient_lists_on_user_id"
  end

  create_table "recipients", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.bigint "list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email", "list_id"], name: "index_recipients_on_email_and_list_id", unique: true
    t.index ["list_id"], name: "index_recipients_on_list_id"
  end

  create_table "senders", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_senders_on_user_id"
  end

  create_table "templates", force: :cascade do |t|
    t.string "name"
    t.text "body"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_templates_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "newsletters", "recipient_lists", column: "list_id"
  add_foreign_key "newsletters", "senders"
  add_foreign_key "newsletters", "templates"
  add_foreign_key "recipient_lists", "users"
  add_foreign_key "recipients", "recipient_lists", column: "list_id"
  add_foreign_key "senders", "users"
  add_foreign_key "templates", "users"
end
