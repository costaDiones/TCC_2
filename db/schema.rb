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

ActiveRecord::Schema.define(version: 20151120005856) do

  create_table "calleds", force: :cascade do |t|
    t.string   "affair",         limit: 255
    t.date     "datescheduling"
    t.string   "typecalled",     limit: 255
    t.text     "description",    limit: 65535
    t.integer  "user_id",        limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "calleds", ["user_id"], name: "index_calleds_on_user_id", using: :btree

  create_table "hydrometers", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "hydrometers", ["user_id"], name: "index_hydrometers_on_user_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.string   "affair",       limit: 255
    t.string   "type",         limit: 255
    t.date     "daterequest"
    t.text     "descripition", limit: 65535
    t.integer  "user_id",      limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "typerequest",  limit: 255
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "princes", force: :cascade do |t|
    t.float    "valueNormal", limit: 24
    t.float    "valueAbove",  limit: 24
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.date     "datePrince"
  end

  create_table "problems", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.text     "descripition", limit: 65535
    t.integer  "user_id",      limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "problems", ["user_id"], name: "index_problems_on_user_id", using: :btree

  create_table "readings", force: :cascade do |t|
    t.date     "date_reading"
    t.float    "reading",         limit: 24
    t.integer  "consumption",     limit: 4
    t.integer  "month_reference", limit: 4
    t.float    "invoiceValue",    limit: 24
    t.string   "paid",            limit: 255
    t.integer  "hydrometer_id",   limit: 4
    t.integer  "prince_id",       limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "readings", ["hydrometer_id"], name: "index_readings_on_hydrometer_id", using: :btree
  add_index "readings", ["prince_id"], name: "index_readings_on_prince_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "nome",                   limit: 255
    t.string   "sexo",                   limit: 255
    t.string   "cpf",                    limit: 255
    t.date     "datanascimento"
    t.string   "endereco",               limit: 255
    t.string   "bairro",                 limit: 255
    t.string   "numero",                 limit: 255
    t.string   "cidade",                 limit: 255
    t.string   "uf",                     limit: 255
    t.string   "complemento",            limit: 255
    t.string   "telefone",               limit: 255
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "role",                   limit: 4,   default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "calleds", "users"
  add_foreign_key "hydrometers", "users"
  add_foreign_key "orders", "users"
  add_foreign_key "problems", "users"
  add_foreign_key "readings", "hydrometers"
  add_foreign_key "readings", "princes"
end
