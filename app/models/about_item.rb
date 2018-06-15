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

class AboutItem < ApplicationRecord
  validates :sort_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :sort_id, uniqueness: true

  mount_uploader :image, ImageUploader
end
