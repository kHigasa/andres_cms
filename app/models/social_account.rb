# == Schema Information
#
# Table name: social_accounts
#
#  id           :bigint(8)        not null, primary key
#  account_type :integer
#  url          :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#

class SocialAccount < ApplicationRecord
  belongs_to :user, touch: true

  enum account_type: {
    facebook: 0,
    twitter: 1,
    github: 2
  }

  validates :user, presence: true
  validates :url, presence: true, uniqueness: true
  validates :account_type, presence: true
end
