class AddDepartmentsAndProblemsAndSolutions < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
      t.string :description

      t.timestamps
    end

    create_table :problems do |t|
      t.string :name
      t.text :introduction
      t.string :duration
      t.string :video_link
      t.string :pdf_link
      t.references :department
      t.timestamps
    end

    create_table :solution_categories do |t|
      t.string :name
      t.text :introduction
      t.string :duration
      t.string :video_link
      t.string :pdf_link
      t.references :department
      t.timestamps
    end

    change_table :health_resources do |t|
      t.references :department
      t.references :problem
      t.references :solution_category
    end
  end
end
