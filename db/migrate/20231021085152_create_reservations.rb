class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :room, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.integer :status, default: 0

      t.timestamps
    end

    add_index :reservations, [:start_date, :end_date]

  end
end
