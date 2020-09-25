class AddHealthResourceIdToFavorites < ActiveRecord::Migration
  def change
    add_column :favorites, :health_resource_id, :integer
  end
end
