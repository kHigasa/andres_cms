class AddColumnToUploadFiles < ActiveRecord::Migration[5.2]
  def change
    add_column :upload_files, :file_tmp, :string
  end
end
