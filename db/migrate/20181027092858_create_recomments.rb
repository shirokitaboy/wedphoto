class CreateRecomments < ActiveRecord::Migration[5.1]
  def change
    create_table :recomments do |t|

      t.timestamps
    end
  end
end
