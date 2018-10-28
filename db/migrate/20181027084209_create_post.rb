class CreatePost < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.text :comment
      t.string :image

      t.timestamps
    end
  end
end
