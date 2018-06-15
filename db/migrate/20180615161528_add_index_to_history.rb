class AddIndexToHistory < ActiveRecord::Migration[5.2]
  def change
    add_column :histories, :generation_code, :string
  end
end
