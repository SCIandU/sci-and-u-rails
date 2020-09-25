class CreateHealthResources < ActiveRecord::Migration
  def change
    create_table :health_resources do |t|
      t.string :title
      t.string :description
      t.string :url
      t.string :format
      t.string :audience
      t.string :tool_type
      t.boolean :free, default: true, null: false
      t.string :screenshots
      t.boolean :published, default: false, null: false

      t.references :user

      t.timestamps null: false
    end
  end
end
