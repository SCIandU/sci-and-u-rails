class AddCoachstatusToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :program_status, :integer  	
  end
end
