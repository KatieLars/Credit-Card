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

ActiveRecord::Schema.define(version: 20180518201555) do

  create_table "accounts", force: :cascade do |t|
    t.float "current_balance", default: 0.0
    t.integer "credit_limit"
    t.float "apr"
    t.date "opening_date", default: "2018-05-18"
  end

  create_table "charges", force: :cascade do |t|
    t.float "amount"
    t.integer "credit_card_id"
    t.date "date", default: "2018-05-18"
  end

  create_table "payments", force: :cascade do |t|
    t.float "amount"
    t.integer "credit_card_id"
    t.date "date", default: "2018-05-18"
  end

end
