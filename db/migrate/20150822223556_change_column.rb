class ChangeColumn < ActiveRecord::Migration
  def change
    rename_column :posts, :tag, :tags
  end
end
