class AddDepartmentToBasicPages < ActiveRecord::Migration
  def change
  	add_column :basic_pages, :department_id, :integer  	
  end
end
