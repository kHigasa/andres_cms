# == Schema Information
#
# Table name: posts
#
#  id            :bigint(8)        not null, primary key
#  title         :string(255)
#  lead_sentence :string(255)
#  accepted      :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  topic         :integer
#

FactoryBot.define do
  factory :post do
    title 'MyString'
    lead_sentence 'MyString'
    accepted false
    published_at '2018-05-04 11:08:57'
  end
end
