# == Schema Information
#
# Table name: items
#
#  id         :bigint(8)        not null, primary key
#  sort_rank  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer
#  target_id  :integer
#

FactoryBot.define do
  factory :item do
    sort_rank 1
    target_type 'MyString'
  end
end
