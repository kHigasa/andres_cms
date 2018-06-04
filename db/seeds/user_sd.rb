Rails.logger.info __FILE__

User.destroy_all

User.create!(
  id: 1,
  username: 'hogehoge',
  email: 'amicola_1129@ezweb.ne.jp',
  password: 'foobar',
  image: File.open('./app/frontend/packs/images/steroidt_oc.png'),
  introduction: 'Intro',
  description: 'Desc',
  admin: true
)

30.times do |i|
  i += 1
  image = if (i % 3).zero? && !(i % 5).zero?
            File.open('./app/frontend/packs/images/bouncer_oc.png')
          elsif (i % 5).zero?
            File.open('./app/frontend/packs/images/spider_oc.jpg')
          else
            ''
          end
  User.create(
    username: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::DragonBall.character.downcase!,
    image: image,
    introduction: Faker::HarryPotter.character,
    description: Faker::ChuckNorris.fact,
    admin: Faker::Boolean.boolean
  )
end
