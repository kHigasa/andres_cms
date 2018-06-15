# == Schema Information
#
# Table name: histories
#
#  id              :bigint(8)        not null, primary key
#  generation_name :string(255)
#  image           :string(255)
#  description     :text(65535)
#  file            :string(255)
#  file_type       :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  generation_code :string(255)
#

require 'rails_helper'

RSpec.describe History, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
