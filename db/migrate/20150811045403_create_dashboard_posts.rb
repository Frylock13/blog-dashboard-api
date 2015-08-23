class CreateDashboardPosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :short
      t.text :content
      t.string :tags, array: true
      t.integer :status, default: 1
      t.integer :user_id
      t.timestamps null: false
    end

    add_index :posts, :user_id
  end
end
