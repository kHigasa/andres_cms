Rails.logger.info __FILE__

Question.destroy_all
faq_categories = FaqCategory.all
faq_categories.each do |faq_category|
  3.times do
    Question.create!(
      faq_category_id: faq_category.id,
      question: Faker::Lorem.question,
      answer: Faker::Lorem.paragraph
    )
  end
end
