class Problem < ActiveRecord::Base
  has_many :health_resources, (-> { published })
  belongs_to :department

  validates :name, presence: true, uniqueness: true

  include Impressionist::IsImpressionable
  is_impressionable  
end
