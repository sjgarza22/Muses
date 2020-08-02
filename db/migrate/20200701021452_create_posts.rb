class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.datetime :created_at
      t.integer :user_id
      t.integer :muse_id
    end
  end
end
