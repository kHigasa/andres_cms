# == Schema Information
#
# Table name: post_items
#
#  id          :bigint(8)        not null, primary key
#  image       :string(255)
#  description :text(65535)
#  sort_rank   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  post_id     :integer
#  image_tmp   :string(255)
#

FactoryBot.define do
  factory :post_item do
    image 'MyString'
    description 'MyText'
  end
end
