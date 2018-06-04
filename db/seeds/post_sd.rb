Rails.logger.info __FILE__

Post.destroy_all
50.times do |i|
  i += 1
  topic = if (i % 3).zero?
            :event
          elsif (i % 5).zero?
            :news
          else
            :column
          end
  Post.create(
    title: Faker::Lorem.word,
    lead_sentence: Faker::Lorem.sentence,
    accepted: Faker::Boolean.boolean,
    published_at: Faker::Date.between(1.year.from_now, Time.zone.today),
    topic: topic
  )
end
