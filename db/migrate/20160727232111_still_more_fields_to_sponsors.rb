class StillMoreFieldsToSponsors < ActiveRecord::Migration
  def change
    add_column :sponsors, :user_id, :integer  
    add_column :sponsors, :salon_event_id, :integer     
    add_column :sponsors, :blog_post_id, :integer  	
  end  	
end
