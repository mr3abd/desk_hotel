# == Schema Information
#
# Table name: reservations
#
#  id         :bigint           not null, primary key
#  end_date   :date
#  start_date :date
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  room_id    :bigint           not null
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
class Reservation < ApplicationRecord
  belongs_to :room
end