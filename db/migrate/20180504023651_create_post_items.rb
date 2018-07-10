class CreatePostItems < ActiveRecord::Migration[5.1]
  def change
    create_table :post_items do |t|
      t.string :image
      t.text :description
      t.integer :sort_rank

      t.timestamps
    end
  end
end
