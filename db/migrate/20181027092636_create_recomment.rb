class CreateRecomment < ActiveRecord::Migration[5.1]
  def change
    create_table :recomments do |t|
      t.integer :user_id
      t.integer :post_id
      t.text :content
      t.timestamps
    end
  end
end
