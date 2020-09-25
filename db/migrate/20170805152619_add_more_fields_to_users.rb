class AddMoreFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :with_sci, :boolean
  end
end
