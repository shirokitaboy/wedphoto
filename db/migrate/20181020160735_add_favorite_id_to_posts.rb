class AddFavoriteIdToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :favorite_id, :integer
  end
end
