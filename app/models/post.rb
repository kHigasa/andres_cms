# == Schema Information
#
# Table name: posts
#
#  id            :bigint(8)        not null, primary key
#  title         :string(255)
#  lead_sentence :string(255)
#  accepted      :boolean
#  published_at  :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  topic         :integer
#

class Post < ApplicationRecord
  extend Enumerize
  has_many :items, dependent: :destroy
  has_many :tags, dependent: :destroy

  validates :title, presence: true
  validates :topic, presence: true

  enumerize :topic, in: { news: 0, event: 1, column: 2 }

  class << self
    def news
      where(topic: :news)
    end

    def event
      where(topic: :event)
    end

    def column
      where(topic: :column)
    end
  end
end
