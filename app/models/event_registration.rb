class EventRegistration < ActiveRecord::Base
	belongs_to :user
	belongs_to :salon_event
end
