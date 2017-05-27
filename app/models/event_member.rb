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
  # References
  belongs_to :event
  belongs_to :member
  counter_culture :event
  counter_culture :member

  validates :member_id, presence: true, uniqueness: { scope: [:event_id] }
end
