class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :comment
      t.boolean :published, default: false, null: false
      
      t.references :user
      t.references :health_resource

      t.timestamps null: false
    end
  end
end
