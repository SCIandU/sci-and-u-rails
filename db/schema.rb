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

ActiveRecord::Schema.define(version: 20200616235239) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
    t.index ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type", using: :btree
    t.index ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree
  end

  create_table "badges_sashes", force: :cascade do |t|
    t.integer  "badge_id"
    t.integer  "sash_id"
    t.boolean  "notified_user", default: false
    t.datetime "created_at"
    t.index ["badge_id", "sash_id"], name: "index_badges_sashes_on_badge_id_and_sash_id", using: :btree
    t.index ["badge_id"], name: "index_badges_sashes_on_badge_id", using: :btree
    t.index ["sash_id"], name: "index_badges_sashes_on_sash_id", using: :btree
  end

  create_table "basic_pages", force: :cascade do |t|
    t.string   "name"
    t.text     "body"
    t.string   "image_url"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "department_id"
    t.boolean  "published"
  end

  create_table "blog_comments", force: :cascade do |t|
    t.text     "comment"
    t.integer  "user_id"
    t.integer  "blog_post_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.boolean  "published"
    t.index ["blog_post_id"], name: "index_blog_comments_on_blog_post_id", using: :btree
    t.index ["user_id"], name: "index_blog_comments_on_user_id", using: :btree
  end

  create_table "blog_posts", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.text     "content"
    t.integer  "department_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "sponsor_id"
    t.string   "attachment"
    t.boolean  "published"
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "video_intro"
    t.string   "link"
  end

  create_table "event_registrations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "salon_event_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.boolean  "waitlist"
    t.boolean  "tech_help"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "user"
    t.integer  "resource"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
    t.integer  "health_resource_id"
    t.integer  "session"
  end

  create_table "health_resource_screenshots", force: :cascade do |t|
  end

  create_table "health_resources", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "url"
    t.string   "format"
    t.string   "audience"
    t.string   "tool_type"
    t.boolean  "free",                 default: true,  null: false
    t.boolean  "published",            default: false, null: false
    t.integer  "user_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "department_id"
    t.integer  "problem_id"
    t.integer  "solution_category_id"
    t.integer  "sponsor_id"
    t.string   "attachment"
    t.boolean  "for_coaching",         default: false
    t.string   "user_group"
    t.boolean  "us"
  end

  create_table "impressions", force: :cascade do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "view_name"
    t.string   "request_hash"
    t.string   "ip_address"
    t.string   "session_hash"
    t.text     "message"
    t.text     "referrer"
    t.text     "params"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index", using: :btree
    t.index ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index", using: :btree
    t.index ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index", using: :btree
    t.index ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index", using: :btree
    t.index ["impressionable_type", "impressionable_id", "params"], name: "poly_params_request_index", using: :btree
    t.index ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index", using: :btree
    t.index ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index", using: :btree
    t.index ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index", using: :btree
    t.index ["user_id"], name: "index_impressions_on_user_id", using: :btree
  end

  create_table "intake_forms", force: :cascade do |t|
    t.string   "platform"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "province"
    t.string   "postal_code"
    t.string   "home_phone"
    t.string   "alternate_phone"
    t.integer  "dob"
    t.integer  "age"
    t.boolean  "sex"
    t.integer  "date_of_sci"
    t.string   "level_of_sci"
    t.string   "cause_of_sci"
    t.string   "asia_class"
    t.string   "injury_description"
    t.string   "mobility_method"
    t.string   "ethnicity"
    t.string   "education"
    t.string   "marital_status"
    t.boolean  "internet_connection"
    t.integer  "internet_connection_methods"
    t.text     "how"
    t.boolean  "bowel"
    t.boolean  "bladder"
    t.boolean  "skin"
    t.boolean  "exercise"
    t.text     "what"
    t.integer  "user_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "tablet"
    t.boolean  "smartphone"
    t.boolean  "desktop_mac"
    t.boolean  "desktop_pc"
    t.boolean  "skype"
    t.boolean  "hangouts"
    t.boolean  "chat"
    t.boolean  "email"
    t.boolean  "telephone"
  end

  create_table "locations", force: :cascade do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mars_ratings", force: :cascade do |t|
    t.string   "platform"
    t.integer  "engagement1"
    t.integer  "engagement2"
    t.integer  "engagement3"
    t.integer  "engagement4"
    t.integer  "engagement5"
    t.integer  "functionality1"
    t.integer  "functionality2"
    t.integer  "functionality3"
    t.integer  "functionality4"
    t.integer  "aesthetics1"
    t.integer  "aesthetics2"
    t.integer  "aesthetics3"
    t.integer  "information1"
    t.integer  "information2"
    t.integer  "information3"
    t.integer  "information4"
    t.integer  "information5"
    t.integer  "information6"
    t.integer  "information7"
    t.integer  "subjective1"
    t.integer  "subjective2"
    t.integer  "subjective3"
    t.integer  "subjective4"
    t.integer  "appspecific1"
    t.integer  "appspecific2"
    t.integer  "appspecific3"
    t.integer  "appspecific4"
    t.integer  "appspecific5"
    t.integer  "appspecific6"
    t.text     "feedback"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.boolean  "tech_help"
    t.boolean  "consent"
    t.string   "device"
  end

  create_table "merit_actions", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "action_method"
    t.integer  "action_value"
    t.boolean  "had_errors",    default: false
    t.string   "target_model"
    t.integer  "target_id"
    t.text     "target_data"
    t.boolean  "processed",     default: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "merit_activity_logs", force: :cascade do |t|
    t.integer  "action_id"
    t.string   "related_change_type"
    t.integer  "related_change_id"
    t.string   "description"
    t.datetime "created_at"
  end

  create_table "merit_score_points", force: :cascade do |t|
    t.integer  "score_id"
    t.integer  "num_points", default: 0
    t.string   "log"
    t.datetime "created_at"
    t.index ["score_id"], name: "index_merit_score_points_on_score_id", using: :btree
  end

  create_table "merit_scores", force: :cascade do |t|
    t.integer "sash_id"
    t.string  "category", default: "default"
    t.index ["sash_id"], name: "index_merit_scores_on_sash_id", using: :btree
  end

  create_table "problems", force: :cascade do |t|
    t.string   "name"
    t.text     "introduction"
    t.string   "duration"
    t.string   "video_link"
    t.string   "pdf_link"
    t.integer  "department_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "salon_event_id"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.boolean  "approved"
    t.text     "userquestion"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.text     "comment"
    t.boolean  "published",          default: false, null: false
    t.integer  "user_id"
    t.integer  "health_resource_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "salon_events", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "event_date"
    t.text     "url"
    t.text     "archive_link"
    t.integer  "organizational_affiliation"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "department_id"
    t.boolean  "published",                  default: false
    t.integer  "sponsor_id"
    t.string   "attachment"
    t.string   "podcast"
    t.integer  "duration"
    t.index ["department_id"], name: "index_salon_events_on_department_id", using: :btree
  end

  create_table "sashes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scripts_and_tips", force: :cascade do |t|
    t.text     "script"
    t.text     "tip"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "user_id"
    t.integer  "department_id"
    t.integer  "solution_category_id"
    t.text     "repeat_script"
    t.boolean  "us"
  end

  create_table "solution_categories", force: :cascade do |t|
    t.string   "name"
    t.text     "introduction"
    t.string   "duration"
    t.string   "video_link"
    t.string   "pdf_link"
    t.integer  "department_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sponsors", force: :cascade do |t|
    t.string   "logo"
    t.boolean  "sponsor"
    t.boolean  "partner"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "name"
    t.integer  "health_resource_id"
    t.integer  "user_id"
    t.integer  "salon_event_id"
    t.integer  "blog_post_id"
    t.text     "description"
    t.string   "url"
    t.boolean  "published"
  end

  create_table "stories", force: :cascade do |t|
    t.string   "title"
    t.string   "youtube_link"
    t.string   "attachment"
    t.integer  "department_id"
    t.integer  "sponsor_id"
    t.integer  "owner_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.boolean  "published"
  end

  create_table "survey_questions", force: :cascade do |t|
    t.integer  "department_id"
    t.integer  "survey_id"
    t.integer  "survey_group_id"
    t.string   "instructions"
    t.string   "survey_question"
    t.string   "survey_type"
    t.integer  "survey_numoptions"
    t.string   "survey_image1"
    t.string   "survey_image2"
    t.string   "survey_image3"
    t.string   "survey_image4"
    t.string   "survey_q1"
    t.string   "survey_q2"
    t.string   "survey_q3"
    t.string   "survey_q4"
    t.string   "survey_q5"
    t.string   "survey_q6"
    t.string   "survey_q7"
    t.string   "survey_q8"
    t.string   "survey_q9"
    t.string   "survey_q10"
    t.string   "survey_q11"
    t.string   "survey_q12"
    t.string   "survey_correct"
    t.boolean  "published",         default: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "survey_scores", force: :cascade do |t|
    t.integer  "survey_id"
    t.integer  "user_id"
    t.integer  "survey_score"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "surveys", force: :cascade do |t|
    t.integer  "department_id"
    t.string   "name"
    t.text     "description"
    t.integer  "survey_total"
    t.boolean  "published",     default: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                       default: "",      null: false
    t.string   "encrypted_password",          default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",               default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "job_title"
    t.text     "blurb"
    t.string   "location"
    t.integer  "role"
    t.integer  "age"
    t.string   "injury_level"
    t.string   "organizational_affiliations"
    t.integer  "sponsor_id"
    t.integer  "coach_id"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "attachment"
    t.boolean  "approved",                    default: false,   null: false
    t.string   "profile_image"
    t.string   "how"
    t.boolean  "with_sci"
    t.float    "total_time_online"
    t.datetime "dob"
    t.text     "whyhere"
    t.datetime "injury_date"
    t.string   "gender"
    t.string   "provider",                    default: "email", null: false
    t.string   "uid",                         default: "",      null: false
    t.string   "tokens"
    t.boolean  "allow_api_access",            default: false
    t.integer  "sash_id"
    t.integer  "level",                       default: 0
    t.integer  "program_status"
    t.boolean  "badge_updated"
    t.string   "login"
    t.index ["approved"], name: "index_users_on_approved", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "blog_comments", "blog_posts"
  add_foreign_key "blog_comments", "users"
  add_foreign_key "salon_events", "departments"
end
