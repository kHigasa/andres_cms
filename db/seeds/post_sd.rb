Rails.logger.info __FILE__

Post.destroy_all
50.times do
  Post.create(
    title: Faker::Lorem.word,
    lead_sentence: Faker::Lorem.sentence,
    accepted: Faker::Boolean.boolean,
    published_at: Faker::Date.between(1.year.from_now, Time.zone.today),
    topic: Faker::Number.between(0, 2)
  )
end
