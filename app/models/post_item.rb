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
#

class PostItem < ApplicationRecord
  belongs_to :post, touch: true
  validates :description, presence: true
  validates :sort_rank, presence: true, uniqueness: { scope: :post_id },
                        numericality: { only_integer: true, greater_than: 0 }
  mount_uploader :image, ImageUploader
  store_in_background :image
end
