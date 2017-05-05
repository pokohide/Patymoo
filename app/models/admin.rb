# == Schema Information
#
# Table name: admins
#
#  id                              :integer          not null, primary key
#  username                        :string           not null
#  email                           :string           not null
#  crypted_password                :string
#  salt                            :string
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#  remember_me_token               :string
#  remember_me_token_expires_at    :datetime
#  activation_state                :string
#  activation_token                :string
#  activation_token_expires_at     :datetime
#  failed_logins_count             :integer          default(0)
#  lock_expires_at                 :datetime
#  unlock_token                    :string
#  reset_password_token            :string
#  reset_password_token_expires_at :datetime
#  reset_password_email_sent_at    :datetime
#
# Indexes
#
#  index_admins_on_activation_token      (activation_token)
#  index_admins_on_email                 (email) UNIQUE
#  index_admins_on_remember_me_token     (remember_me_token)
#  index_admins_on_reset_password_token  (reset_password_token)
#  index_admins_on_unlock_token          (unlock_token)
#

class Admin < ApplicationRecord
  authenticates_with_sorcery!

  # Validation
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 },
    if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true,
      if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true,
    if: -> { new_record? || changes[:crypted_password] }

  # References
  has_many :events, dependent: :destroy
  has_many :members, dependent: :destroy
end
