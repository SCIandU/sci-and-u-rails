class AddResearchParticipantFlagToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_research_participant, :boolean, default: false
  end
end
