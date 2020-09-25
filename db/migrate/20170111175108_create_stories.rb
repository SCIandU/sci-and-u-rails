class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.string :youtube_link
      t.string :attachment
      t.integer :department_id
      t.integer :sponsor_id
      t.integer :owner_id

      t.timestamps null: false
    end
  end
end
