class AddWaitListToEventRegistrations < ActiveRecord::Migration
  def change
  	add_column :event_registrations, :waitlist, :boolean    	
  end
end
