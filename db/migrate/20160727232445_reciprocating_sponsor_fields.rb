class ReciprocatingSponsorFields < ActiveRecord::Migration
  def change
    add_column :health_resources, :sponsor_id, :integer  
    add_column :blog_posts, :sponsor_id, :integer      
    add_column :users, :sponsor_id, :integer  	        	  
  end
end
