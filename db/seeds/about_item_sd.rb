Rails.logger.info __FILE__

AboutItem.destroy_all
5.times do |i|
  i += 1
  image = if (i % 3).zero? && !(i % 5).zero?
            File.open('./app/frontend/packs/images/bouncer_oc.png')
          elsif (i % 5).zero?
            File.open('./app/frontend/packs/images/spider_oc.jpg')
          else
            ''
          end
  AboutItem.create(
    sort_rank: i,
    image: image,
    description: Faker::Lorem.sentence
  )
end
