# == Schema Information
#
# Table name: rooms
#
#  id           :bigint           not null, primary key
#  capacity     :integer          default(5)
#  description  :text
#  price        :decimal(, )
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  room_type_id :bigint           not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_rooms_on_room_type_id  (room_type_id)
#  index_rooms_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (room_type_id => room_types.id)
#  fk_rails_...  (user_id => users.id)
#
class RoomSerializer
  include JSONAPI::Serializer
  attributes :price
end
