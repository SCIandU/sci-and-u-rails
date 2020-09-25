class IncludeInSessionTools < ActiveRecord::Migration
  def change
  	add_column :health_resources, :for_coaching, :boolean, default: false 	
  end
end
