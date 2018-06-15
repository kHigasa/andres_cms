class AddIndexToActivity < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :history_id, :integer
  end
end
