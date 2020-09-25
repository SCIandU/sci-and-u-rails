class Sponsor < ActiveRecord::Base
  has_many :health_resources
  has_many :blog_posts
  has_many :salon_events  
  has_many :users	
end
