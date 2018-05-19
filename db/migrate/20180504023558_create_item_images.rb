class CreateItemImages < ActiveRecord::Migration[5.1]
  def change
    create_table :item_images do |t|
      t.string :image
      t.string :caption

      t.timestamps
    end
  end
end
