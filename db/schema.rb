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

ActiveRecord::Schema.define(:version => 20140418032046) do

  create_table "hosts", :force => true do |t|
    t.string   "name"
    t.string   "vmpid"
    t.string   "vmpip"
    t.string   "totalcpu"
    t.string   "usedcpu"
    t.string   "totalmem"
    t.string   "usedmem"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "hosts_storages", :id => false, :force => true do |t|
    t.integer "storage_id"
    t.integer "host_id"
  end

  add_index "hosts_storages", ["storage_id", "host_id"], :name => "index_hosts_storages_on_storage_id_and_host_id"

  create_table "storages", :force => true do |t|
    t.string   "name"
    t.string   "vmpid"
    t.string   "vmptype"
    t.string   "totalsize"
    t.string   "usedsize"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "vms", :force => true do |t|
    t.integer  "host_id"
    t.integer  "storage_id"
    t.string   "name"
    t.string   "vmtype"
    t.string   "workrunid"
    t.string   "vmstatus"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "vms", ["host_id"], :name => "index_vms_on_host_id"
  add_index "vms", ["storage_id"], :name => "index_vms_on_storage_id"

end
