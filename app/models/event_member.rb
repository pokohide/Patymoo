# == Schema Information
#
# Table name: event_members
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  member_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_event_members_on_event_id   (event_id)
#  index_event_members_on_member_id  (member_id)
#

class EventMember < ApplicationRecord
  NESTED_ALLOWED_PARAMS = [
    :id, :_destroy, :event_id, :member_id,
    member_attributes: Member::ALLOWED_PARAMS
  ]

  # References
  belongs_to :event
  belongs_to :member

  # accepts_nested_attributes_for :member, reject_if: :all_blank

  counter_culture :event, column_name: 'events_count'
  counter_culture :member, column_name: 'members_count'

  validates :member_id, presence: true, uniqueness: { scope: [:event_id] }
end
