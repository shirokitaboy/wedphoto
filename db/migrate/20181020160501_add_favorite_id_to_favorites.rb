class AddFavoriteIdToFavorites < ActiveRecord::Migration[5.1]
  def change
    add_column :favorites, :favorite_id, :integer
  end
end
