# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string(255)
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  image_tmp              :string(255)
#  provider               :string(255)
#  uid                    :string(255)
#  admin                  :boolean          default(FALSE), not null
#  image                  :string(255)
#  introduction           :text(65535)
#  description            :text(65535)
#  username               :string(255)
#

FactoryBot.define do
  pass = Faker::Internet.password(8)
  factory :user do
    username              Faker::Lorem
    email                 Faker::Internet.email
    password              pass
    password_confirmation pass
  end
end
