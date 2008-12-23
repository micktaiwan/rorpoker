# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20081223115154) do

  create_table "comments", :force => true do |t|
    t.integer  "game_id",    :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at", :null => false
    t.text     "comment"
  end

  create_table "games", :force => true do |t|
    t.integer  "group_id",   :null => false
    t.datetime "created_at", :null => false
    t.date     "date"
    t.string   "place"
  end

  create_table "groups", :force => true do |t|
    t.string   "name",       :limit => 40, :default => "", :null => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "invitations", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "invited_id", :null => false
    t.integer  "group_id"
    t.string   "key"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.text     "msg"
  end

  create_table "memberships", :force => true do |t|
    t.integer  "group_id",                  :null => false
    t.integer  "user_id",                   :null => false
    t.datetime "created_at",                :null => false
    t.integer  "active",     :default => 1
  end

  create_table "particips", :force => true do |t|
    t.integer "game_id", :null => false
    t.integer "user_id", :null => false
    t.integer "chips"
    t.integer "rank"
  end

  create_table "users", :force => true do |t|
    t.string   "name",       :limit => 40, :default => "", :null => false
    t.string   "email",                                    :null => false
    t.string   "password",   :limit => 40,                 :null => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "lost_key"
    t.datetime "last_login"
    t.string   "settings"
  end

  add_index "users", ["email"], :name => "email", :unique => true
  add_index "users", ["name"], :name => "name", :unique => true

end
