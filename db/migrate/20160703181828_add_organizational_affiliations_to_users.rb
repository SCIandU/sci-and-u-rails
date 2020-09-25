class AddOrganizationalAffiliationsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :organizational_affiliations, :string  	
  end
end
