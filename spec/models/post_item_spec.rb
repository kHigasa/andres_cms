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

require 'rails_helper'

RSpec.describe ItemImage, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
