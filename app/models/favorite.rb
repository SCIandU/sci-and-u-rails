class Favorite < ActiveRecord::Base
  belongs_to :health_resource
  belongs_to :user
end
