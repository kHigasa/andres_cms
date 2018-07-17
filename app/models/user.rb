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

class User < ApplicationRecord
  has_many :social_accounts, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         # :confirmable,
         :lockable, :timeoutable, :omniauthable,
         authentication_keys: [:login]
  attr_accessor :login

  mount_uploader :image, ImageUploader
  store_in_background :image if Rails.env.production?

  # Override condition of authentication
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).find_by(['username = :value OR lower(email) = lower(:value)', { value: login }])
    else
      find_by(conditions)
    end
  end

  def self.new_with_session(params, session)
    if session['devise_user.attributes']
      new(session['devise.user.attributes']) do |user|
        user.attributes = params
      end
    else
      super
    end
  end

  # Get user or create user if there isn't user in record
  def self.find_for_oauth(auth)
    user = User.find_by(uid: auth.uid, provider: auth.provider)
    user ||= User.create(
      uid:      auth.uid,
      provider: auth.provider,
      email:    User.dummy_email(auth),
      password: Devise.friendly_token[0, 20]
    )
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
