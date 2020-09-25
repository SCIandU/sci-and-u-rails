class DeleteUselessColumns < ActiveRecord::Migration
  def change
   	remove_column :blog_posts, :image_url  

   	remove_column :health_resources, :screenshots	
   	remove_column :health_resources, :thumbnail_file_name
   	remove_column :health_resources, :thumbnail_content_type
   	remove_column :health_resources, :thumbnail_file_size
   	remove_column :health_resources, :thumbnail_updated_at
    
   	remove_column :salon_events, :image 

   	add_column :sponsors, :description, :text
   	add_column :sponsors, :url, :string
   	
   	remove_column :users, :image_file_name
   	remove_column :users, :image_content_type
   	remove_column :users, :image_file_size
   	remove_column :users, :image_updated_at
   	remove_column :users, :profile_image
   	remove_column :users, :image_url 
  end

end
