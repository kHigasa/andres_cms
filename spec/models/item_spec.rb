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

require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
