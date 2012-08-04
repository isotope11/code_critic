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

ActiveRecord::Schema.define(:version => 20120723204846) do

  create_table "activities", :force => true do |t|
    t.integer  "actor_id"
    t.string   "actor_type"
    t.integer  "target_id"
    t.string   "target_type"
    t.string   "activity_type"
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["actor_id"], :name => "index_activities_on_actor_id"
  add_index "activities", ["target_id"], :name => "index_activities_on_target_id"

  create_table "comments", :force => true do |t|
    t.integer  "owner_id",         :null => false
    t.integer  "commentable_id",   :null => false
    t.string   "commentable_type", :null => false
    t.text     "body",             :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "commits", :force => true do |t|
    t.string   "sha"
    t.integer  "repo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "file_line_placeholders", :force => true do |t|
    t.integer "commit_id"
    t.integer "file_index"
    t.integer "line_index"
  end

  add_index "file_line_placeholders", ["commit_id", "file_index", "line_index"], :name => "idx_flp_on_cid_findex_lindex"

  create_table "file_placeholders", :force => true do |t|
    t.integer "commit_id"
    t.integer "file_index"
  end

  add_index "file_placeholders", ["commit_id", "file_index"], :name => "index_file_placeholders_on_commit_id_and_file_index"

  create_table "git_commits", :force => true do |t|
    t.text     "payload"
    t.integer  "git_push_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "git_pushes", :force => true do |t|
    t.text     "payload"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "github_concernable_git_pushes", :force => true do |t|
    t.string   "github_concernable_type"
    t.integer  "github_concernable_id"
    t.integer  "git_push_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "repos", :force => true do |t|
    t.string "name"
    t.string "url"
  end

  create_table "review_requests", :force => true do |t|
    t.integer  "reviewable_id"
    t.string   "reviewable_type"
    t.integer  "commit_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",           :default => "review_created"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
