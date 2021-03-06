# == Schema Information
#
# Table name: supporters
#
#  id         :bigint(8)        not null, primary key
#  sort_rank  :integer
#  type       :integer
#  image      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  url        :string(255)
#  image_tmp  :string(255)
#

class Supporter < ApplicationRecord
  extend Enumerize
  validates :type, presence: true
  validates :sort_rank, presence: true, uniqueness: { scope: :type },
                        numericality: { only_integer: true, greater_than: 0 }
  validates :image, presence: true
  mount_uploader :image, ImageUploader
  # store_in_background :image if Rails.env.production?
  enumerize :type, in: { kyousann: 0, kouenn: 1, josei: 2 }
  # Not to rename type in ActiveRecord
  self.inheritance_column = :_type_disabled

  class << self
    def kyousann
      where(type: :kyousann)
    end

    def kouenn
      where(type: :kouenn)
    end

    def josei
      where(type: :josei)
    end
  end
end
