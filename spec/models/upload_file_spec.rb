# == Schema Information
#
# Table name: upload_files
#
#  id         :bigint(8)        not null, primary key
#  name       :string(255)
#  file       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  history_id :integer
#

require 'rails_helper'

RSpec.describe UploadFile, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
