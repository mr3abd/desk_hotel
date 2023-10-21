class RoomController < ApiController
  before_action :set_room, only: %i[show update]
  def index
    pagy_option, rooms = pagy(Room.filter(room_filter_params), page: pagination_params[:page],
    items: pagination_params[:per_page])
    authorize! :read, rooms

      render json:
                 RoomSerializer.new(rooms).serializable_hash.merge!(
                    info: {
                      page: pagy_option.page, next: pagy_option.next,
                      items: pagy_option.items, pages: pagy_option.pages
                    }
      ), status: :ok
  end

  def create
    room = current_user.build_room(room_params)
    authorize! :create, room

    if room.save
      render json: RoomSerializer.new(room).serializable_hash, status: :ok
    else
      render json: room.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: RoomSerializer.new(@room).serializable_hash, status: :ok
  end

  def update
    authorize! :update, @room
    @room.update(room_params)
    head(:ok)
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:room_type_id, :user_id, :description, :price, :capacity)
  end

  def room_filter_params
    params.slice(:room_tpye_id, :price_gt, :price_less)
  end
end
