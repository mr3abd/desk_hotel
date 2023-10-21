class ReservationController < ApiController
  before_action :set_reservation, only: %i[update]

  def index
    pagy_option, reservations = pagy(Reservation.filter(reservation_filter_params), page: pagination_params[:page],
    items: pagination_params[:per_page])

      render json:
                  ReservationSerializer.new(reservations).serializable_hash.merge!(
                    info: {
                      page: pagy_option.page, next: pagy_option.next,
                      items: pagy_option.items, pages: pagy_option.pages
                    }
      ), status: :ok
  end
  def create
    authorize! :create, Reservation.new
    ActiveRecord::Base.transaction do
      reservation = Reservation.new(reservation_params)
      if reservation.save
        render json: reservation, status: :created
      else
        render json: reservation.errors, status: :unprocessable_entity
      end
      rescue => error
        render json: error
    end
  end
  def update
    authorize! :create, Reservation
    @reservation.update(reservation_params)
    head(:ok)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:room_id, :start_date, :end_date, :guests_count, :status)
  end

  def reservation_filter_params
    params.slice(:start_date, :end_date)
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

end
