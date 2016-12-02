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

ActiveRecord::Schema.define(version: 20161129032150) do

  create_table "action_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "actions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "action_type_id"
    t.integer  "article_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["action_type_id"], name: "index_actions_on_action_type_id", using: :btree
    t.index ["article_id"], name: "index_actions_on_article_id", using: :btree
    t.index ["user_id"], name: "index_actions_on_user_id", using: :btree
  end

  create_table "article_authors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "article_id", null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_article_authors_on_article_id", using: :btree
    t.index ["user_id"], name: "index_article_authors_on_user_id", using: :btree
  end

  create_table "article_histories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",                                            null: false
    t.integer  "last_updated_user_id",                               null: false
    t.integer  "article_type_id",                                    null: false
    t.integer  "article_id",                                         null: false
    t.string   "title",                                              null: false
    t.text     "body",                 limit: 65535,                 null: false
    t.boolean  "draft",                              default: false, null: false
    t.integer  "version",                            default: 1,     null: false
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.index ["article_id"], name: "index_article_histories_on_article_id", using: :btree
  end

  create_table "article_tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "article_id", null: false
    t.integer  "tag_id",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_article_tags_on_article_id", using: :btree
    t.index ["tag_id"], name: "index_article_tags_on_tag_id", using: :btree
  end

  create_table "article_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",                                            null: false
    t.integer  "last_updated_user_id",                               null: false
    t.integer  "article_type_id",                                    null: false
    t.string   "title",                                              null: false
    t.text     "body",                 limit: 65535,                 null: false
    t.boolean  "draft",                              default: false, null: false
    t.integer  "version",                            default: 1,     null: false
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.index ["article_type_id"], name: "index_articles_on_article_type_id", using: :btree
    t.index ["user_id"], name: "index_articles_on_user_id", using: :btree
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",                  null: false
    t.integer  "article_id",               null: false
    t.text     "body",       limit: 65535, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["article_id"], name: "index_comments_on_article_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "likes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",    null: false
    t.integer  "article_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_likes_on_article_id", using: :btree
    t.index ["user_id"], name: "index_likes_on_user_id", using: :btree
  end

  create_table "stocks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",    null: false
    t.integer  "article_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_stocks_on_article_id", using: :btree
    t.index ["user_id"], name: "index_stocks_on_user_id", using: :btree
  end

  create_table "tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",            null: false
    t.string   "email",           null: false
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "actions", "action_types"
  add_foreign_key "actions", "articles"
  add_foreign_key "actions", "users"
  add_foreign_key "article_authors", "articles"
  add_foreign_key "article_authors", "users"
  add_foreign_key "article_histories", "articles"
  add_foreign_key "article_tags", "articles"
  add_foreign_key "article_tags", "tags"
  add_foreign_key "articles", "article_types"
  add_foreign_key "articles", "users"
  add_foreign_key "comments", "articles"
  add_foreign_key "comments", "users"
  add_foreign_key "likes", "articles"
  add_foreign_key "likes", "users"
  add_foreign_key "stocks", "articles"
  add_foreign_key "stocks", "users"
end
