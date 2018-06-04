Rails.logger.info __FILE__

User.destroy_all
User.create!(
  id: 1,
  username: 'hogehoge',
  email: 'amicola_1129@ezweb.ne.jp',
  password: 'foobar',
  image: '',
  introduction: 'Intro',
  description: 'Desc',
  admin: true
)
30.times do |i|
  i += 1
  image = if (i % 2).zero?
            ''
          else
            :column
          end
  User.create(
    username: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::DragonBall.character.downcase!,
    image: image,
    introduction: Faker::Football.player,
    description: Faker::ChuckNorris.fact,
    admin: Faker::Boolean.boolean
  )
end
