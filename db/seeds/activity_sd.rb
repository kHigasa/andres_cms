Rails.logger.info __FILE__

Activity.destroy_all
histories = History.all
histories.each do |history|
  2.times do
    Activity.create!(
      history_id: history.id,
      title: Faker::Hacker.ingverb,
      content: Faker::Lorem.sentence
    )
  end
end
