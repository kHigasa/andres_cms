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

require 'rails_helper'

RSpec.describe Post, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
