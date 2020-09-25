class CreateBlogComments < ActiveRecord::Migration
  def change
    create_table :blog_comments do |t|
      t.text :comment
      t.references :user, index: true, foreign_key: true
      t.references :blog_post, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
