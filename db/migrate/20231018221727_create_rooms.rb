class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.text :description
      t.integer :capacity
      t.decimal :price

      t.timestamps
    end
  end
end
