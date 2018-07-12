class AddColumnToAboutItems < ActiveRecord::Migration[5.2]
  def change
    add_column :about_items, :image_tmp, :string
  end
end
