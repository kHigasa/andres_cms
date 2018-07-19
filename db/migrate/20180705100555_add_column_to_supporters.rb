class AddColumnToSupporters < ActiveRecord::Migration[5.2]
  def change
    add_column :supporters, :url, :string
    add_column :supporters, :image_tmp, :string
  end
end
