class AddPodCastToEvent < ActiveRecord::Migration
  def change
  	add_column :salon_events, :podcast, :string    	  
  end
end
