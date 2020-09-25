class CreateIntakeForms < ActiveRecord::Migration
  def change
    create_table :intake_forms do |t|
      t.string :platform

      t.string :address1
      t.string :address2
      t.string :city  
      t.string :province  
      t.string :postal_code        

      t.string :home_phone
      t.string :alternate_phone

      t.integer :dob
      t.integer :age
      t.boolean :sex
      t.integer :date_of_sci
      t.string :level_of_sci
      t.string :cause_of_sci               
      t.string :asia_class
      t.string :injury_description      
      t.string :mobility_method     
      t.string :ethnicity                  
      t.string :education      
      t.string :marital_status

      t.boolean :internet_connection      
      t.integer :internet_connection_methods   

      t.text :how      

      t.boolean :bowel
      t.boolean :bladder
      t.boolean :skin
      t.boolean :exercise      

      t.text :what            

      t.references :user	

      t.timestamps null: false
    end
  end
end
