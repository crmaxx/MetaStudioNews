class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :news, :user_id
  end
end
