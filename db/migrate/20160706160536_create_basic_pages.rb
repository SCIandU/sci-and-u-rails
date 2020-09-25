class CreateBasicPages < ActiveRecord::Migration
  def change
    create_table :basic_pages do |t|
      t.string :name
      t.text :body
      t.string :image_url

      t.timestamps null: false
    end
  end
end
