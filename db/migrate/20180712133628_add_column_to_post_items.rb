class AddColumnToPostItems < ActiveRecord::Migration[5.2]
  def change
    add_column :post_items, :image_tmp, :string
  end
end
