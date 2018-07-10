Rails.logger.info __FILE__

Post.destroy_all
50.times do
  Post.create(
    title: Faker::Lorem.word,
    lead_sentence: Faker::Lorem.sentence,
    accepted: Faker::Boolean.boolean,
    topic: Faker::Number.between(0, 2)
  )
end
