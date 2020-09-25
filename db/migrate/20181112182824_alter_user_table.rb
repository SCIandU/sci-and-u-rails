class AlterUserTable < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :coach_status
  	remove_column :users, :skypehandle
  	remove_column :users, :is_research_participant
  	remove_column :users, :read_form
  	remove_column :users, :orientation  	
  	add_column :users, :badge_updated, :boolean
  end
end
