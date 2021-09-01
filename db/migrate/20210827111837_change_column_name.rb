class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :tags, :tag_name
    rename_column :tags, :name, :tag_name
  end
end
