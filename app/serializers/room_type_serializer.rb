# == Schema Information
#
# Table name: room_types
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class RoomTypeSerializer
  include JSONAPI::Serializer
  attributes :id, :title
end
