# == Schema Information
#
# Table name: item_images
#
#  id         :bigint(8)        not null, primary key
#  image      :string(255)
#  caption    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :item_image do
    image 'MyString'
    caption 'MyString'
  end
end
