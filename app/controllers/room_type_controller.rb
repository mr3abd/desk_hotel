class RoomTypeController < ApplicationController
  def index
    pagy_option, room_types = pagy(RoomType.all, page: pagination_params[:page],
    items: pagination_params[:per_page])
      render json:
                 RoomTypeSerializer.new(room_types).serializable_hash.merge!(
                    info: {
                      page: pagy_option.page, next: pagy_option.next,
                      items: pagy_option.items, pages: pagy_option.pages
                    }
      ), status: :ok
  end
  end
end
