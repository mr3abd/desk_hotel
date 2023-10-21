p "start add samples"
# create User
users = User.create!(
  [
    {
      email: "abdo@7dr.me",
      password: "HELLOaa",
      role: :read
    },
    {
      email: "abdo+create_room@7dr.me",
      password: "HELLOaa",
      role: :create_room
    },
    {
      email: "abdo+manage@7dr.me",
      password: "HELLOaa",
      role: :manage
    }
  ]
)
# create room types
3.times { |i|  RoomType.create(title: "Test #{i + 1 }") }
# Create Rooms
room = Room.create(user: users.last, price: 30, room_type_id: RoomType.first.id, capacity: 10 )
# Reservation
Reservation.create(room: room,start_date: Time.now + 10.days, end_date: Time.now + 20.days, guests_count: 5)
p "done"
