class AddPublishedAndDepartmentRefToSalonEvents < ActiveRecord::Migration
  def change
    add_reference :salon_events, :department, index: true, foreign_key: true
    add_column :salon_events, :published, :boolean, default: false  	
  end
end
