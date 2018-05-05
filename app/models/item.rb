# == Schema Information
#
# Table name: items
#
#  id          :bigint(8)        not null, primary key
#  sort_rank   :integer
#  target_type :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Item < ApplicationRecord
  belongs_to :post, touch: true
  belongs_to :target, polymorphic: true

  enum target_type: {
    text: 'ItemText',
    image: 'ItemImage'
  }
end
