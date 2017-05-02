# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  admin_id    :integer
#  name        :string(64)       not null
#  description :text
#  link        :string
#  start_at    :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_events_on_admin_id  (admin_id)
#

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
