class CreateMuses < ActiveRecord::Migration
  def change
    create_table :muses do |t|
      t.string :blog_name
      t.string :name
      t.text :about
      t.integer :user_id
    end
  end
end
