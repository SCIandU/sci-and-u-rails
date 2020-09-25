class AddEvenMoreFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :total_time_online, :Float
  end
end
