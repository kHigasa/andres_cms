# == Schema Information
#
# Table name: upload_files
#
#  id         :bigint(8)        not null, primary key
#  name       :string(255)
#  file       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  history_id :integer
#  file_tmp   :string(255)
#

FactoryBot.define do
  factory :upload_file do
    name 'MyString'
    file 'MyString'
  end
end
