class ApiController < ActionController::API
  include Pagy::Backend
  before_action :authenticate_user!
  respond_to :json
  rescue_from ActiveRecord::RecordNotFound, with: :resource_not_found
  rescue_from ActionController::ParameterMissing, with: :params_missing
  rescue_from Pagy::OverflowError, with: :redirect_to_last_page
  rescue_from CanCan::AccessDenied, with: :resource_unauthorized
  protected

  def resource_not_found
    head(:not_found)
  end

  def resource_unauthorized
    render json: { success: false, error: 'unauthorized', status: 401 }, status: :unauthorized
  end

  def params_missing(message)
    render json: { msg: message }, status: :bad_request
  end

  def pagination_params
    pagination_params = params.slice(:page, :per_page)
    { page: pagination_params[:page] || 1, per_page: pagination_params[:per_page] || 10 }
  end

  def redirect_to_last_page(exception)
    redirect_to url_for(page: exception.pagy.last),
                notice: "Page ##{params[:page]} is overflowing. Showing page #{exception.pagy.last} instead."
  end
end
