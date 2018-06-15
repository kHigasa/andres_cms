class CreateAboutItems < ActiveRecord::Migration[5.2]
  def change
    create_table :about_items do |t|
      t.string :image
      t.text :description

      t.timestamps
    end
  end
end
