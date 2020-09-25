class AddApprovedToQuestions < ActiveRecord::Migration
  def change
  	add_column :questions, :approved, :boolean      	
  end
end
