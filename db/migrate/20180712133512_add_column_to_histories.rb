class AddColumnToHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :histories, :image_tmp, :string
  end
end
