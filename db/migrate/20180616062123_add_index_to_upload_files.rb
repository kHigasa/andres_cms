class AddIndexToUploadFiles < ActiveRecord::Migration[5.2]
  def change
    add_column :upload_files, :history_id, :integer
    add_index :upload_files, :history_id
  end
end
