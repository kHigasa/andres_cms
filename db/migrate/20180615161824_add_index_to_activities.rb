class AddIndexToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :history_id, :integer
    add_index :activities, :history_id
  end
end
