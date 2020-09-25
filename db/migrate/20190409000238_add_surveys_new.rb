class AddSurveysNew < ActiveRecord::Migration[5.0]
 def change

=begin	drop_table :survey_score
	#drop_table :survey_questions
	#drop_table :survey_options
	#drop_table :survey_attempts
	#drop_table :survey_answers  
    drop_table :survey

   create_table :surveys do |t|
     t.integer :department_id
     t.string  :name
     t.text    :description
     t.integer :survey_total    
     t.boolean :published, :default => false
     t.timestamps
   end   

   create_table :survey_scores do |t|
     t.integer :survey_id
     t.integer :user_id     
     t.integer :survey_score 
     t.timestamps
   end   
=end
	end	
end
