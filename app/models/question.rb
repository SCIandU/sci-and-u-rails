class Question < ActiveRecord::Base

  scope :approved, (-> { where(approved: true) })
  scope :unapproved, (-> { where(approved: false) })

  belongs_to :salon_event
  belongs_to :user	
  
end
