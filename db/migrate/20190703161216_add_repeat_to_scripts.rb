class AddRepeatToScripts < ActiveRecord::Migration[5.0]
  def change
  	add_column :scripts_and_tips, :repeat_script, :text
  end
end
