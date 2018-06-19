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

class Question < ApplicationRecord
  belongs_to :faq_category
  validates :question, presence: true
  validates :answer, presence: true
end
