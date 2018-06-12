# == Schema Information
#
# Table name: items
#
#  id         :bigint(8)        not null, primary key
#  sort_rank  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer
#  target_id  :integer
#

class Item < ApplicationRecord
  belongs_to :post, touch: true
  belongs_to :target, polymorphic: true

  enum target_type: {
    text: 'ItemText',
    image: 'ItemImage'
  }

  after_destroy :destroy_target

  validates :sort_rank, presence: true
  validates :target_type, presence: true

  private

  def destroy_target
    target.destroy
  end
end
