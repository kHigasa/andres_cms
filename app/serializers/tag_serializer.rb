# == Schema Information
#
# Table name: tags
#
#  id         :bigint(8)        not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer
#

class TagSerializer < ActiveModel::Serializer
  attributes :id, :name, :post_id
end
