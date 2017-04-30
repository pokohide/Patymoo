# == Schema Information
#
# Table name: admins
#
#  id                           :integer          not null, primary key
#  username                     :string           not null
#  email                        :string           not null
#  crypted_password             :string
#  salt                         :string
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  remember_me_token            :string
#  remember_me_token_expires_at :datetime
#  activation_state             :string
#  activation_token             :string
#  activation_token_expires_at  :datetime
#
# Indexes
#
#  index_admins_on_activation_token   (activation_token)
#  index_admins_on_email              (email) UNIQUE
#  index_admins_on_remember_me_token  (remember_me_token)
#

class Admin < ApplicationRecord
  authenticates_with_sorcery!

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 },
    if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true,
      if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true,
    if: -> { new_record? || changes[:crypted_password] }
end
