class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :faq_category_id
      t.text :question
      t.text :answer

      t.timestamps
    end
    add_index :questions, :faq_category_id
  end
end
