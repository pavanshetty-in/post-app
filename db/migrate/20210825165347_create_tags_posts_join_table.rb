class CreateTagsPostsJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :tags, :posts
  end
end
