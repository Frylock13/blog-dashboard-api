class AddAttachmentImageToDashboardPosts < ActiveRecord::Migration
  def self.up
    change_table :dashboard_posts do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :dashboard_posts, :image
  end
end
