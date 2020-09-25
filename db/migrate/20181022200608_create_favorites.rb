class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :user
      t.integer :resource

      t.timestamps null: false
    end
  end
end
