class SolutionCategory < ActiveRecord::Base
  has_many :health_resources, (-> { published })
  belongs_to :department
  has_many :scripts_and_tips
  
  validates :name, presence: true, uniqueness: true

  include Impressionist::IsImpressionable
  is_impressionable
end
