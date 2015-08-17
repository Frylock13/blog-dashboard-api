class CreateDashboardPosts < ActiveRecord::Migration
  def change
    create_table :dashboard_posts do |t|
      t.string :title
      t.string :short
      t.text :content
      t.string :tag
      t.boolean :published, default: true

      t.timestamps null: false
    end
  end
end
