# == Schema Information
#
# Table name: events
#
#  id            :integer          not null, primary key
#  admin_id      :integer
#  name          :string(64)       not null
#  description   :text
#  link          :string
#  start_at      :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  members_count :integer          default(0), not null
#
# Indexes
#
#  index_events_on_admin_id  (admin_id)
#

class Event < ApplicationRecord
  # Validation

  # References
  belongs_to :admin
  counter_culture :admin
  has_many :event_members, dependent: :destroy
  has_many :members, through: :event_members

  # Scope
  scope :like, ->(q) {
    where('name like ?', "%#{q}%") if q.present?
  }
  scope :asc, -> { order(open_date: :asc) }

  accepts_nested_attributes_for :event_members, allow_destroy: true, reject_if: :all_blank
end
