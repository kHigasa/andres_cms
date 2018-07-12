# == Schema Information
#
# Table name: about_items
#
#  id          :bigint(8)        not null, primary key
#  sort_id     :integer
#  image       :string(255)
#  description :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image_tmp   :string(255)
#

class AboutItem < ApplicationRecord
  validates :sort_id, presence: true, uniqueness: true,
                      numericality: { only_integer: true, greater_than: 0 }

  mount_uploader :image, ImageUploader
  store_in_background :image if Rails.env.production?
end
