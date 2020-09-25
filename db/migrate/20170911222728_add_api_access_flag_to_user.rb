class AddApiAccessFlagToUser < ActiveRecord::Migration
  def change
    add_column :users, :allow_api_access, :boolean, default: false
  end
end
