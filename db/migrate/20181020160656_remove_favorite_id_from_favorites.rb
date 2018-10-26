class RemoveFavoriteIdFromFavorites < ActiveRecord::Migration[5.1]
  def change
    remove_column :favorites, :favorite_id, :integer
  end
end
