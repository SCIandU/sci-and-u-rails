class AddFieldsToSponsors < ActiveRecord::Migration
  def change
    add_column :sponsors, :name, :string
    add_column :sponsors, :health_resource_id, :integer    
  end
end
