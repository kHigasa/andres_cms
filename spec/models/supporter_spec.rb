# == Schema Information
#
# Table name: supporters
#
#  id         :bigint(8)        not null, primary key
#  type       :integer
#  image      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  url        :string(255)
#  image_tmp  :string(255)
#

require 'rails_helper'

RSpec.describe Supporter, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
