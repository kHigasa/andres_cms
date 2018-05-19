class CreateItemTexts < ActiveRecord::Migration[5.1]
  def change
    create_table :item_texts do |t|
      t.text :description

      t.timestamps
    end
  end
end
