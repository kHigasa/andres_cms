# == Schema Information
#
# Table name: supporters
#
#  id         :bigint(8)        not null, primary key
#  type       :integer
#  image      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  url        :string(255)
#

FactoryBot.define do
  factory :supporter do
    type 1
    image 'MyString'
  end
end
