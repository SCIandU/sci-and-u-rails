class AddAgeAndInjuryToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :age, :integer
  	add_column :users, :injury_level, :string
  end
end
