class AddIndexToAboutItems < ActiveRecord::Migration[5.2]
  def change
    add_column :about_items, :sort_id, :integer
    add_index :about_items, :sort_id, unique: true
  end
end
