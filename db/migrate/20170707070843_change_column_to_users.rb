class ChangeColumnToUsers < ActiveRecord::Migration
  def change
  	change_column :users, :is_research_participant, :boolean, default: false, null: false
  end
end
