# == Schema Information
#
# Table name: messages
#
#  id          :integer          not null, primary key
#  content     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  sender_id   :integer
#  receiver_id :integer
#

require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
