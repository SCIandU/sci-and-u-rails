class AddImageUploadToSalonEvents < ActiveRecord::Migration
  def change
  	add_column :salon_events, :attachment, :string   
  	add_column :blog_posts, :attachment, :string    
  	add_column :users, :attachment, :string    	  
  end
end
