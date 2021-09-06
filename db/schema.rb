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

ActiveRecord::Schema.define(version: 20210903182031) do

  create_table "answers", force: :cascade do |t|
    t.text     "body",                        null: false
    t.boolean  "correct",     default: false
    t.integer  "question_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.text     "body",       null: false
    t.integer  "test_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "test_passages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "test_id"
    t.integer  "current_question_id"
    t.integer  "correct_questions",   default: 0
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "test_passages", ["current_question_id"], name: "index_test_passages_on_current_question_id"
  add_index "test_passages", ["test_id"], name: "index_test_passages_on_test_id"
  add_index "test_passages", ["user_id"], name: "index_test_passages_on_user_id"

  create_table "tests", force: :cascade do |t|
    t.string   "title",                   null: false
    t.integer  "level",       default: 0
    t.integer  "category_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "user_id"
  end

  add_index "tests", ["title", "level"], name: "index_tests_on_title_and_level", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "email",                           null: false
    t.string   "password_digest",                 null: false
    t.boolean  "admin",           default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

end
