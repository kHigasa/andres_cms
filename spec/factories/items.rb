# == Schema Information
#
# Table name: items
#
#  id          :bigint(8)        not null, primary key
#  sort_rank   :integer
#  target_type :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :item do
    sort_rank 1
    target_type 'MyString'
  end
end
