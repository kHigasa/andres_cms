# == Schema Information
#
# Table name: supporters
#
#  id         :bigint(8)        not null, primary key
#  type       :integer
#  image      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Supporter < ApplicationRecord
  validates :type, presence: true
  validates :image, presence: true
  mount_uploader :image, ImageUploader

  enum type: {
    kyousann: 0,
    kouenn: 1
  }
end
