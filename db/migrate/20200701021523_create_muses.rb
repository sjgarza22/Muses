class CreateMuses < ActiveRecord::Migration
  def change
    create_table :muses do |t|
      t.string :name
      t.text :about
      t.integer :user_id
      t.integer :post_id
    end
  end
end
