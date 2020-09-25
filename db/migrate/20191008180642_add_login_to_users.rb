class AddLoginToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :login, :string
    add_column :health_resources, :user_group, :string
  end
end
