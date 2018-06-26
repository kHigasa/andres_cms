# == Schema Information
#
# Table name: faq_categories
#
#  id         :bigint(8)        not null, primary key
#  category   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe FaqCategory, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
