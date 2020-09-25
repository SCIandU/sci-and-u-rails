class CreateHealthResourceScreenshots < ActiveRecord::Migration
  def change
    create_table :health_resource_screenshots do |t|
      t.text :url
      t.references :health_resource

      t.timestamps null: false
    end
  end
end
