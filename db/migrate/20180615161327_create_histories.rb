class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.string :generation_name
      t.string :image
      t.text :description
      t.string :file
      t.string :file_type

      t.timestamps
    end
  end
end
