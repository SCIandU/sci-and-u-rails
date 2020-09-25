class AddStillMoreFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :dob, :datetime
    add_column :users, :whyhere, :text
    add_column :users, :injury_date, :datetime
  end
end
