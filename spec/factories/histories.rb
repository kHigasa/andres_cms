# == Schema Information
#
# Table name: histories
#
#  id              :bigint(8)        not null, primary key
#  generation_name :string(255)
#  image           :string(255)
#  description     :text(65535)
#  file            :string(255)
#  file_type       :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  generation_code :string(255)
#

FactoryBot.define do
  factory :history do
    generation_name 'MyString'
    image 'MyString'
    description 'MyText'
    file 'MyString'
    file_type 'MyString'
  end
end