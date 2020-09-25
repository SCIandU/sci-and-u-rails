class AddHelpToEventRegistrations < ActiveRecord::Migration
  def change  
  	add_column :event_registrations, :tech_help, :boolean    	  
  end
end
