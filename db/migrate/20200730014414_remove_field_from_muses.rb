class RemoveFieldFromMuses < ActiveRecord::Migration
  def change
    remove_column :muses, :post_id, :integer
  end
end
