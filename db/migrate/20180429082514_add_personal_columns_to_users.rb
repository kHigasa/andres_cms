class AddPersonalColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :image, :string
    add_column :users, :introduction, :text
    add_column :users, :description, :text
  end
end
