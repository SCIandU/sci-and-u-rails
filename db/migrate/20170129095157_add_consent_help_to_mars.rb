class AddConsentHelpToMars < ActiveRecord::Migration
  def change
  	add_column :mars_ratings, :tech_help, :boolean    	  
  	add_column :mars_ratings, :consent, :boolean    
  	add_column :mars_ratings, :device, :string    
  end
end
