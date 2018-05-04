class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.integer :sort_rank
      t.string :target_type

      t.timestamps
    end
  end
end
