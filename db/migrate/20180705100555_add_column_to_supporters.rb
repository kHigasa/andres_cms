class AddColumnToSupporters < ActiveRecord::Migration[5.2]
  def change
    add_column :supporters, :url, :string
  end
end
