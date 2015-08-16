class CreateDashboardPosts < ActiveRecord::Migration
  def change
    create_table :dashboard_posts do |t|
      t.string :title
      t.string :short
      t.text :desc
      t.string :topic

      t.timestamps null: false
    end
  end
end
