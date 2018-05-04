class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :lead_sentence
      t.boolean :accepted
      t.datetime :published_at

      t.timestamps
    end
  end
end
