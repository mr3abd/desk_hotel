# == Schema Information
#
# Table name: reservations
#
#  id           :bigint           not null, primary key
#  amount       :decimal(, )      default(0.0)
#  end_date     :date
#  guests_count :integer
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
class Reservation < ApplicationRecord
  include Filterable

  # Association
  belongs_to :room

  # Enum
  enum status: { active: 0, cancel: 1  }

  # Validations
  validates :start_date, :end_date, presence: true
  before_validation :validate_guests_count
  before_validation :validate_dates


  # Callbacks
  before_create :set_amount_value

  # Scopes
  scope :filter_by_start_date, ->(start_date) { where start_date: start_date.to_date }
  scope :filter_by_end_date, ->(end_date) { where end_date: end_date.to_date}

  private
  def set_amount_value
     self.amount = (start_date..end_date).count * room.price
  end

  def validate_guests_count
    return if room.capacity >= guests_count
    errors.add(:base, "please check room capcity ")
  end

  def validate_dates

    errors.add(:base, "that dates unlogic") unless start_date < end_date

    unvalid_reservation = room.reservations.where(start_date: start_date.., end_date: ..end_date).exists?

    errors.add(:base, "that unvalid dates") if unvalid_reservation
  end
end
