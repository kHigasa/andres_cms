Rails.logger.info __FILE__

History.destroy_all
50.times do |i|
  i += 1
  image = if (i % 2).zero?
            File.open('./app/frontend/packs/images/bouncer_oc.png')
          else
            File.open('./app/frontend/packs/images/spider_oc.jpg')
          end
  History.create(
    generation_code: Faker::Name.initials,
    generation_name: Faker::Pokemon.name,
    image: image,
    description: Faker::Lorem.sentence
  )
end
