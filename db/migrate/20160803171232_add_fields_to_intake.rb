class AddFieldsToIntake < ActiveRecord::Migration
  def change
  	add_column :intake_forms, :tablet, :boolean    
  	add_column :intake_forms, :smartphone, :boolean    
  	add_column :intake_forms, :desktop_mac, :boolean    
  	add_column :intake_forms, :desktop_pc, :boolean    
  	add_column :intake_forms, :skype, :boolean    
  	add_column :intake_forms, :hangouts, :boolean    
  	add_column :intake_forms, :chat, :boolean    
  	add_column :intake_forms, :email, :boolean    
  	add_column :intake_forms, :telephone, :boolean      	
  end
end
