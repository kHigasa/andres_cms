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

class PostSerializer < ActiveModel::Serializer
  has_many :tags
  attributes :id, :title, :lead_sentence, :topic, :created_at, :updated_at, :published_at
end
