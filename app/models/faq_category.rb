# == Schema Information
#
# Table name: faq_categories
#
#  id         :bigint(8)        not null, primary key
#  category   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FaqCategory < ApplicationRecord
  has_many :questions, dependent: :destroy
  validates :category, presence: true
end
