class AddFieldToQuestions < ActiveRecord::Migration
  def change
  	add_column :questions, :userquestion, :text     
   remove_column :questions, :question  	 	
  end
end
