class AddIndexToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :post_id, :integer
    add_index :items, :post_id
    add_column :items, :target_id, :integer
    add_index :items, :target_id
    add_column :items, :target_type, :string
    add_index :items, :target_type
  end
end
