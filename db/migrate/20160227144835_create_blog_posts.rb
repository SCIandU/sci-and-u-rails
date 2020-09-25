class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.references :user
      t.text :content
      t.references :department

      t.timestamps null: false
    end
  end
end
