class AddUStoHealthResources < ActiveRecord::Migration[5.0]
  def change
    add_column :health_resources, :us, :boolean  	
    add_column :scripts_and_tips, :us, :boolean  	    
  end
end
