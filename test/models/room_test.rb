# == Schema Information
#
# Table name: rooms
#
#  id           :bigint           not null, primary key
#  capacity     :integer
#  description  :text
#  price        :decimal(, )
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  room_type_id :bigint           not null
#
# Indexes
#
#  index_rooms_on_room_type_id  (room_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (room_type_id => room_types.id)
#
require "test_helper"

class RoomTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
