class AddSkypeHandleToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :skypehandle, :string      	 	
  end
end
