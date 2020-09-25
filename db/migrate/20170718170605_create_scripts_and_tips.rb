class CreateScriptsAndTips < ActiveRecord::Migration
  def change
    create_table :scripts_and_tips do |t|
      t.text :script
      t.text :tip

      t.timestamps null: false
    end
  end
end
