# == Schema Information
#
# Table name: about_items
#
#  id          :bigint(8)        not null, primary key
#  sort_id     :integer          not null
#  image       :string(255)
#  description :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe AboutItem, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
