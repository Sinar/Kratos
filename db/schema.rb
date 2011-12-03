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

ActiveRecord::Schema.define(:version => 20111202192919) do

  create_table "coalitions", :id => false, :force => true do |t|
    t.string  "code",          :null => false
    t.string  "name",          :null => false
    t.string  "name_in_malay", :null => false
    t.integer "founded_in",    :null => false
    t.integer "disbanded_in"
  end

  add_index "coalitions", ["code"], :name => "index_coalitions_on_code", :unique => true

  create_table "coalitionships", :id => false, :force => true do |t|
    t.string   "uuid",           :null => false
    t.string   "coalition_code"
    t.string   "party_code",     :null => false
    t.integer  "joined_at",      :null => false
    t.integer  "parted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "coalitionships", ["coalition_code"], :name => "index_coalitionships_on_coalition_code"
  add_index "coalitionships", ["party_code"], :name => "index_coalitionships_on_party_code"
  add_index "coalitionships", ["uuid"], :name => "index_coalitionships_on_uuid", :unique => true

  create_table "constituencies", :id => false, :force => true do |t|
    t.string   "uuid",          :limit => 36, :null => false
    t.string   "name",                        :null => false
    t.string   "region_code",                 :null => false
    t.integer  "iteration",                   :null => false
    t.string   "member_uuid",                 :null => false
    t.date     "valid_until"
    t.string   "previous_uuid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "constituencies", ["member_uuid"], :name => "index_constituencies_on_member_uuid"
  add_index "constituencies", ["previous_uuid"], :name => "index_constituencies_on_previous_uuid"
  add_index "constituencies", ["region_code"], :name => "index_constituencies_on_region_code"
  add_index "constituencies", ["uuid"], :name => "index_constituencies_on_uuid", :unique => true

  create_table "members", :id => false, :force => true do |t|
    t.string   "uuid",        :limit => 36, :null => false
    t.string   "name",                      :null => false
    t.string   "email"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "www"
    t.string   "phone"
    t.date     "birthday"
    t.text     "biography"
    t.date     "deceased_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "members", ["uuid"], :name => "index_members_on_uuid", :unique => true

  create_table "parties", :id => false, :force => true do |t|
    t.string  "code",          :null => false
    t.string  "name",          :null => false
    t.string  "name_in_malay", :null => false
    t.integer "founded_in",    :null => false
    t.integer "disbanded_in"
  end

  add_index "parties", ["code"], :name => "index_parties_on_code", :unique => true

  create_table "party_memberships", :id => false, :force => true do |t|
    t.string   "uuid",        :limit => 36, :null => false
    t.string   "party_code",                :null => false
    t.string   "member_uuid",               :null => false
    t.integer  "joined_at",                 :null => false
    t.integer  "parted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "party_memberships", ["party_code", "member_uuid", "joined_at"], :name => "index_party_memberships_on_when_member_joins_party", :unique => true
  add_index "party_memberships", ["uuid"], :name => "index_party_memberships_on_uuid", :unique => true

  create_table "regions", :id => false, :force => true do |t|
    t.string "code", :null => false
    t.string "name", :null => false
  end

  add_index "regions", ["code"], :name => "index_regions_on_code", :unique => true

end