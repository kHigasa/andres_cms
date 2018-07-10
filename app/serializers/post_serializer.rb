# == Schema Information
#
# Table name: posts
#
#  id            :bigint(8)        not null, primary key
#  title         :string(255)
#  lead_sentence :string(255)
#  accepted      :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  topic         :integer
#

class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :lead_sentence, :topic, :created_at, :updated_at
  has_many :tags, serializer: TagSerializer
  has_many :post_items, serializer: PostItemSerializer
end
