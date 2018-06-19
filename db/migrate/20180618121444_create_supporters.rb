class CreateSupporters < ActiveRecord::Migration[5.2]
  def change
    create_table :supporters do |t|
      t.integer :type
      t.string :image

      t.timestamps
    end
  end
end
