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

class ItemImage < ApplicationRecord
  has_one :item, as: :target, dependent: :destroy
end
