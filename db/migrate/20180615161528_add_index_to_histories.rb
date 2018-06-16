class AddIndexToHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :histories, :generation_code, :string
    add_index :histories, :generation_code
  end
end
