Rails.logger.info __FILE__

User.destroy_all
User.create!(
  id: 1,
  username: '学生団体GEIL広報',
  email: 'prgeilpr@gmail.com',
  password: 'publi9relations',
  image: File.open('./app/frontend/packs/images/geil.png'),
  introduction: '学生団体GEILのアカウント',
  description: '主に広報局が利用していますorz',
  admin: true
)

SocialAccount.destroy_all
SocialAccount.create!(
  user_id: 1,
  account_type: :facebook,
  url: 'https://www.facebook.com/policymakingcontestgeil/'
)
SocialAccount.create!(
  user_id: 1,
  account_type: :twitter,
  url: 'https://twitter.com/waavgeil'
)
SocialAccount.create!(
  user_id: 1,
  account_type: :github,
  url: 'https://github.com/kHigasa'
)

Rails.logger.info 'Creating seeds data has completed in production!!'
