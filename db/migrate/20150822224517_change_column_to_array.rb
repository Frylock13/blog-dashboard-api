class ChangeColumnToArray < ActiveRecord::Migration
  def change
    change_column :posts, :tags, "varchar[] USING (string_to_array(tags, ','))"
  end
end
