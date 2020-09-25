class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
    	
      t.string :logo
      t.boolean :sponsor
      t.boolean :partner

      t.timestamps null: false
    end
  end
end
