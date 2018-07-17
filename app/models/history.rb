# == Schema Information
#
# Table name: histories
#
#  id              :bigint(8)        not null, primary key
#  generation_name :string(255)
#  image           :string(255)
#  description     :text(65535)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  generation_code :string(255)
#  image_tmp       :string(255)
#

class History < ApplicationRecord
  has_many :activities, dependent: :destroy
  has_many :upload_files, dependent: :destroy
  validates :generation_code, presence: true, uniqueness: true
  validates :generation_name, presence: true
  mount_uploader :image, ImageUploader
  store_in_background :image if Rails.env.production?
end
