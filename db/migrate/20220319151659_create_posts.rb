class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.boolean :published, default: false
      t.integer :view, default: 0
      t.string :body
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
