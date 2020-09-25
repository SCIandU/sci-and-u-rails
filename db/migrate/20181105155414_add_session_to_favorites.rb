class AddSessionToFavorites < ActiveRecord::Migration[5.0]
  def change
    add_column :favorites, :session, :integer
  end
end
