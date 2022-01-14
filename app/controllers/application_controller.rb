class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
  rescue_from ActionController::ParameterMissing, with: :invalid_request

  private

  def record_not_found
    render :nothing, status: :not_found
  end

  def unprocessable_entity
    render :nothing, status: __method__
  end

  def invalid_request
    render :nothing, status: :bad_request
  end
end
