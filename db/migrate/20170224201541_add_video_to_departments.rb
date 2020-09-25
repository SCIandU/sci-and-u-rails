class AddVideoToDepartments < ActiveRecord::Migration
  def change
   	add_column :departments, :video_intro, :string 	    	
  end
end
