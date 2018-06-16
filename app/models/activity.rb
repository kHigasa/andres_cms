# == Schema Information
#
# Table name: activities
#
#  id                      :bigint(8)        not null, primary key
#  title                   :string(255)
#  content                 :text(65535)
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  history_generation_code :string(255)
#

class Activity < ApplicationRecord
  belongs_to :history, touch: true
end
