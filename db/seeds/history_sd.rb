Rails.logger.info __FILE__

History.destroy_all
50.times do
  History.create(
    generation_code: Faker::Name.initials,
    generation_name: Faker::Name.middle_name,
    image: Faker::Avatar.image,
    description: Faker::Lorem.sentence
  )
end
