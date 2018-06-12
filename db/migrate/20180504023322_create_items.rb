class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.integer :sort_rank

      t.timestamps
    end
  end
end
