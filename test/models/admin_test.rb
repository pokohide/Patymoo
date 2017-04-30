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
#
# Indexes
#
#  index_admins_on_email              (email) UNIQUE
#  index_admins_on_remember_me_token  (remember_me_token)
#

require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
