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

class PostItemSerializer < ActiveModel::Serializer
  attributes :id, :description, :image, :sort_rank
end
