# == Schema Information
#
# Table name: events
#
#  id                  :integer          not null, primary key
#  admin_id            :integer
#  name                :string(64)       not null
#  description         :text
#  link                :string
#  start_at            :datetime
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  event_members_count :integer          default(0), not null
#
# Indexes
#
#  index_events_on_admin_id  (admin_id)
#

class Event < ApplicationRecord
  include SearchModule
  include GraphData

  # References
  belongs_to :admin
  counter_culture :admin

  has_many :event_members, dependent: :destroy

  has_many :members, through: :event_members
  accepts_nested_attributes_for :members

  def members_count
    self.event_members_count
  end
end
