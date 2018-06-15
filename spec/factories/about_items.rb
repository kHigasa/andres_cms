# == Schema Information
#
# Table name: about_items
#
#  id          :bigint(8)        not null, primary key
#  image       :string(255)
#  description :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  sort_id     :integer
#

FactoryBot.define do
  factory :about_item do
    sord_id 1
    image 'MyString'
    description 'MyText'
  end
end
