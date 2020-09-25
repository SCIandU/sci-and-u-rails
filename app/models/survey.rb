class Survey < ActiveRecord::Base
  belongs_to :department

  has_many :survey_questions
  
end
