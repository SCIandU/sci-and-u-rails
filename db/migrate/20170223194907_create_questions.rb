class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :salon_event_id
      t.integer :user_id
      t.text :question

      t.timestamps null: false
    end
  end
end
