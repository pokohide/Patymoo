# == Schema Information
#
# Table name: admins
#
#  id               :integer          not null, primary key
#  username         :string           not null
#  email            :string           not null
#  crypted_password :string
#  salt             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_admins_on_email  (email) UNIQUE
#

class Admin < ApplicationRecord
  authenticates_with_sorcery!

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true,
    length: { minimum: 6 }, if: -> { new_record? || changes['password'] }
end
