class Setup < ActiveRecord::Migration
  def self.up

    create_table "users", :force => true do |t|
      t.string    "name",          :limit => 40, :default => "",  :null => false
      t.string    "email",                                        :null => false
      t.string    "password",      :limit => 40,                  :null => false
      t.datetime  "created_at",                                   :null => false
      t.datetime  "updated_at",                                   :null => false
      t.string    "lost_key"
      t.datetime  "last_login"
      t.string    "settings"
    end
  
    add_index "users", ["email"], :name => "email", :unique => true
    add_index "users", ["name"],  :name => "name",  :unique => true

    create_table  "groups", :force => true do |t|
      t.string    "name",          :limit => 40, :default => "", :null => false
      t.datetime  "created_at",                                  :null => false
      t.datetime  "updated_at",                                  :null => false
    end
  
    create_table "memberships", :force => true do |t|
      t.integer  "group_id", :null => false
      t.integer  "user_id",  :null => false
      t.datetime "created_at",                                  :null => false
      t.integer  "active",   :default => 1
    end
    
    create_table "games", :force => true do |t|
      t.integer  "group_id",    :null => false
      t.datetime "created_at",  :null => false
      t.date     "date"
      t.string   "place"
   end

    create_table "particips", :force => true do |t|
      t.integer  "game_id",   :null => false
      t.integer  "user_id",   :null => false
      t.integer  "chips"     
      t.integer  "rank"
    end
    
    create_table "comments", :force => true do |t|
      t.integer  "game_id",   :null => false
      t.integer  "user_id",   :null => false
      t.datetime "created_at",  :null => false
      t.text     "comment"     
    end

  end
  
  create_table "invitations", :force => true do |t|
    t.integer  "user_id",       :null => false
    t.integer  "invited_id",    :null => false
    t.integer  "group_id"
    t.string   "key"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",   :null => false
    t.text     "msg"
  end

  def self.down
    drop_table :users
    drop_table :groups
    drop_table :memberships
    drop_table :games
    drop_table :particips
    drop_table :invitations
  end
end
