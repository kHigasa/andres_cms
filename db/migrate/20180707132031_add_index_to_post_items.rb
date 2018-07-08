class AddIndexToPostItems < ActiveRecord::Migration[5.2]
  def change
    add_column :post_items, :post_id, :integer
    add_index :post_items, :post_id
  end
end
