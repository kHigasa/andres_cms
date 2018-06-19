# == Schema Information
#
# Table name: questions
#
#  id              :bigint(8)        not null, primary key
#  faq_category_id :integer
#  question        :text(65535)
#  answer          :text(65535)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryBot.define do
  factory :question do
    faq_category_id 1
    question 'MyText'
    answer 'MyText'
  end
end
