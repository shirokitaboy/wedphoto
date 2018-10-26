class RemoveFavoriteIdFromPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :favorite_id, :integer
  end
end
