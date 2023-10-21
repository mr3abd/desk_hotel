# == Schema Information
#
# Table name: reservations
#
#  id           :bigint           not null, primary key
#  amount       :decimal(, )      default(0.0)
#  end_date     :date
#  guests_count :integer          default(1)
#  start_date   :date
#  status       :integer          default("active")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  room_id      :bigint           not null
#
# Indexes
#
#  index_reservations_on_room_id                  (room_id)
#  index_reservations_on_start_date_and_end_date  (start_date,end_date)
#
# Foreign Keys
#
#  fk_rails_...  (room_id => rooms.id)
#
class ReservationSerializer
  include JSONAPI::Serializer
  attributes :id, :start_date, :end_date, :room_id
end
