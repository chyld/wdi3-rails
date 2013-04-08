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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130305152222) do

  create_table "priorities", :force => true do |t|
    t.string   "name"
    t.string   "color",      :default => "#ffffff"
    t.integer  "user_id"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.integer  "value",      :default => 1
  end

  create_table "tasks", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.date     "duedate"
    t.boolean  "is_complete", :default => false
    t.integer  "user_id"
    t.integer  "priority_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.text     "address"
    t.float    "latitude",    :default => 0.0
    t.float    "longitude",   :default => 0.0
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
