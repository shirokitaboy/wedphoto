class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
    t.string :title
    t.text :comment
    t.text :reply
    t.integer :user_id
    t.string :image
    t.integer :like_counter
    t.timestamps
    end
  end
end
