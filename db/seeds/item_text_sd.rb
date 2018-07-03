Rails.logger.info __FILE__

ItemText.destroy_all

100.times do
  ItemText.create!(
    description: Faker::Lorem.sentence
  )
end
