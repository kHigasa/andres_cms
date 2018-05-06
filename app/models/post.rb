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
#  topic_id      :integer
#

class Post < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :tags, dependent: :destroy
  belongs_to_active_hash :topic, optional: false
  validates :title, presence: true
end
