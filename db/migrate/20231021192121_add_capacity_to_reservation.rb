class AddCapacityToReservation < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :guests_count, :integer, default: 1
  end
end
