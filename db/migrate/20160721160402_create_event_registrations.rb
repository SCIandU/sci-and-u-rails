class CreateEventRegistrations < ActiveRecord::Migration
  def change
    create_table :event_registrations do |t|
      t.references :user
      t.references :salon_event   	

      t.timestamps null: false
    end
  end
end
