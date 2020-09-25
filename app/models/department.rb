class Department < ActiveRecord::Base
  has_many :health_resources, (-> { published })
  has_many :solution_categories
  has_many :problems
  has_many :blog_posts
  has_many :salon_events, (-> { published })
  has_many :stories
  has_many :scripts_and_tips
  has_one :survey   
  
  is_impressionable

  DEPARTMENT = [
    "Bladder", "Bowel", "Exercise", "Skin", "Sex and Relationships", "Pain", "Diet", "Caregiving", "Health Basics", "Other"
  ].freeze

end
