class CreateTaglinks < ActiveRecord::Migration[6.1]
  def change
    create_table :taglinks do |t|
      t.integer :post_id, foreign_key: true
      t.integer :tag_id, foreign_key: true

      t.timestamps
    end
  end
end
