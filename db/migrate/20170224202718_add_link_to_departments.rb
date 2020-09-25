class AddLinkToDepartments < ActiveRecord::Migration
  def change
   	add_column :departments, :link, :string 	  	
  end
end
