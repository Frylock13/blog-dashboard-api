class CreateDashboardPosts < ActiveRecord::Migration
  def change
    create_table :dashboard_posts do |t|
      t.string :title
      t.string :short
      t.text :content
      t.string :tag
      t.integer :status, default: 1
      t.integer :dashboard_posts
      t.timestamps null: false
    end

    add_index :dashboard_postsm :user_id
  end
end
