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

  counter_culture :event, column_name: 'events_count'
  counter_culture :member, column_name: 'members_count'
end
