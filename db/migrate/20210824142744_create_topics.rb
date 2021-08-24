class CreateTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :topics do |t|
      t.string :name
      t.string :subtopic
      t.string :link

      t.timestamps
    end
  end
end
