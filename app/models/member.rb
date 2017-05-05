# == Schema Information
#
# Table name: members
#
#  id           :integer          not null, primary key
#  admin_id     :integer
#  name         :string(64)       not null
#  email        :string
#  twitter      :string
#  facebook     :string
#  connpass     :string
#  grade        :integer
#  school_type  :integer
#  school_name  :string
#  department   :string
#  phone_number :string
#  note         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_members_on_admin_id  (admin_id)
#

class Member < ApplicationRecord
  # Validates

  # References
  belongs_to :admin
  has_many :event_members, dependent: :destroy
  has_many :events, through: :event_members

  accepts_nested_attributes_for :event_members, allow_destroy: true
end
