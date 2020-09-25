class ChangeSalonEvents < ActiveRecord::Migration
  def change
    change_table :salon_events do |t|
      t.references :sponsor
    end  	
  end
end
