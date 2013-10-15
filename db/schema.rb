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

ActiveRecord::Schema.define(:version => 20121109120452) do

  create_table "cars", :force => true do |t|
    t.string   "make"
    t.string   "model"
    t.string   "registration"
    t.string   "bookingtype"
    t.date     "servicedue"
    t.date     "lastservice"
    t.boolean  "longtermassigned"
    t.boolean  "forsale"
    t.boolean  "sold"
    t.boolean  "outofaction"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "day_bookings", :force => true do |t|
    t.string   "username"
    t.string   "registration"
    t.date     "day"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "leases", :force => true do |t|
    t.string   "username"
    t.string   "registration"
    t.date     "startdate"
    t.date     "enddate"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "hashed_password"
    t.string   "username"
    t.string   "user_type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
