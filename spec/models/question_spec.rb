# == Schema Information
#
# Table name: questions
#
#  id              :bigint(8)        not null, primary key
#  faq_category_id :integer
#  question        :text(65535)
#  answer          :text(65535)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe Question, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
