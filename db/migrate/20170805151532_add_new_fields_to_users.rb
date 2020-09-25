class AddNewFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :how, :string
    add_column :users, :read_form, :boolean
    add_column :users, :orientation, :boolean
  end
end
