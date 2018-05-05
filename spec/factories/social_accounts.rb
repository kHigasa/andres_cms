# == Schema Information
#
# Table name: social_accounts
#
#  id           :bigint(8)        not null, primary key
#  account_type :integer
#  url          :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryBot.define do
  factory :social_account do
    account_type 1
    url 'MyString'
  end
end