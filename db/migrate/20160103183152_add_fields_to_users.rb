class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :job_title, :string
    add_column :users, :blurb, :text
    add_column :users, :location, :string
    add_column :users, :role, :integer
  end
end
