class MoreUserFields < ActiveRecord::Migration
  def change
    add_column :users, :coach_id, :integer    
    add_column :users, :coach_status, :string        	
  end
end
