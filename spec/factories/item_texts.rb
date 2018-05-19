# == Schema Information
#
# Table name: item_texts
#
#  id          :bigint(8)        not null, primary key
#  description :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :item_text do
    description 'MyText'
  end
end
