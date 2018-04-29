Rails.logger.info __FILE__

User.destroy_all
User.create!(
  id: 1,
  username: 'hogehoge',
  email: 'amicola_1129@ezweb.ne.jp',
  password: 'foobar'
)
