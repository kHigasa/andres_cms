# == Schema Information
#
# Table name: faq_categories
#
#  id         :bigint(8)        not null, primary key
#  category   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :faq_category do
    category 'MyString'
  end
end
