class ScriptsAndTip < ActiveRecord::Base
  belongs_to :user
  belongs_to :department
  belongs_to :solution_category	
end
