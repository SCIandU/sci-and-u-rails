class AddImageUploadToHealthResources < ActiveRecord::Migration
  def change
  	add_column :health_resources, :attachment, :string    	
  end
end
