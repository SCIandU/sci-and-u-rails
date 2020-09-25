class Surveys < ActiveRecord::Migration[5.0]

    #add_column :survey_questions, :survey_id, :integer

	# drop_table :surveys
	# drop_table :survey_scores
	# drop_table :survey_questions	

	# create_table :surveys do |t|
	# 	t.integer :department_id
	# 	t.string  :name
	# 	t.text    :description
	# 	t.integer :survey_total    
	# 	t.boolean :published, :default => false
	# 	t.timestamps
	# end  

 #   create_table :survey_scores do |t|
 #     t.integer :survey_id
 #     t.integer :user_id     
 #     t.integer :survey_score 
 #     t.timestamps
 #   end   	

   # create_table :survey_questions do |t|
   #   t.integer :department_id
   #   t.integer :survey_id
   #   t.integer :survey_group_id
   #   t.string  :instructions
   #   t.string :survey_question
   #   t.string :survey_type
   #   t.integer :survey_numoptions
   #   t.string :survey_image1
   #   t.string :survey_image2
   #   t.string :survey_image3
   #   t.string :survey_image4  
   #   t.string :survey_q1
   #   t.string :survey_q2  
   #   t.string :survey_q3
   #   t.string :survey_q4
   #   t.string :survey_q5
   #   t.string :survey_q6  
   #   t.string :survey_q7
   #   t.string :survey_q8
   #   t.string :survey_q9
   #   t.string :survey_q10  
   #   t.string :survey_q11
   #   t.string :survey_q12
   #   t.string :survey_correct 
   #   t.boolean :published, :default => false     
   #   t.timestamps
   # end

end
