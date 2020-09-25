class AddMissingColumns < ActiveRecord::Migration
  def change
   	add_column :blog_comments, :published, :boolean 	
   	add_column :basic_pages, :published, :boolean 	   
   	add_column :blog_posts, :published, :boolean 	
   	add_column :sponsors, :published, :boolean 	  
   	add_column :stories, :published, :boolean 	  

   	drop_table :health_resource_screenshots
  end
end
