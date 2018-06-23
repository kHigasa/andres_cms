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
  validates :user, presence: true
  validates :url, presence: true, uniqueness: true, format: { with: URI::DEFAULT_PARSER.make_regexp }
  validates :account_type,
            presence: true, uniqueness: true
            # inclusion: {
            #   in: SocialAccount.account_types.keys
            # },
            # uniqueness: {
            #   message: '%{value} is already used'
            # }

  enum account_type: {
    facebook: 0,
    twitter: 1,
    github: 2
  }
end
