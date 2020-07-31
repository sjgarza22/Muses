class CreateJoinTableMusesAndPosts < ActiveRecord::Migration
  def change
    create_table :muse_posts do |t|
      t.integer :muse_id
      t.integer :post_id
    end
  end
end
