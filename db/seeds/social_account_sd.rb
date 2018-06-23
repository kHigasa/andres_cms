Rails.logger.info __FILE__

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
