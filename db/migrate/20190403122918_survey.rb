class Survey < ActiveRecord::Migration[5.0]
  def change

	#drop_table :survey_score
	#drop_table :survey_questions
	#drop_table :survey_options
	#drop_table :survey_attempts
	#drop_table :survey_answers  
    #drop_table :survey

   create_table :surveys do |t|
     t.integer :department_id
     t.string  :name
     t.text    :description
     t.integer :survey_total    
     t.boolean :published, :default => false
     t.timestamps
   end   

   create_table :survey_questions do |t|
     t.integer :department_id
     t.string  :text
     t.string :survey_type
     t.integer :survey_numoptions
     t.string :survey_image
     t.string :survey_q1
     t.string :survey_q2  
     t.string :survey_q3
     t.string :survey_q4
     t.string :survey_q5
     t.string :survey_q6  
     t.string :survey_q7
     t.string :survey_q8
     t.string :survey_q9
     t.string :survey_q10  
     t.string :survey_q11
     t.string :survey_q12
     t.string :survey_correct 
     t.boolean :published, :default => false     
     t.timestamps
   end

   create_table :survey_scores do |t|
     t.integer :survey_id
     t.integer :user_id     
     t.integer :survey_score 
     t.timestamps
   end   


	end	

end
