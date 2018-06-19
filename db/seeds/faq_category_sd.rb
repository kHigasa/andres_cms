Rails.logger.info __FILE__

FaqCategory.destroy_all
5.times do
  FaqCategory.create!(
    category: Faker::Nation.nationality
  )
end
