class AddContentToRecomments < ActiveRecord::Migration[5.1]
  def change
    add_column :recomments, :post_id, :integer
    add_column :recomments, :user_id, :integer
    add_column :recomments, :content, :text
  end
end
