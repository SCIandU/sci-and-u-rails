class CreateSalonEvents < ActiveRecord::Migration
  def change
    create_table :salon_events do |t|
      t.string :title
      t.text :description
      t.datetime :event_date
      t.text :url
      t.text :archive_link
      t.text :image
      t.integer :organizational_affiliation

      t.timestamps null: false
    end
  end
end
