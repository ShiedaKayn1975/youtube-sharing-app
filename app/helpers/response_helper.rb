# frozen_string_literal: true

module ResponseHelper
  def status_ok
    render json: { status: :success }, status: :ok
  end

  # Render status 422
  # @param [ActiveRecord | String] record_or_msg Bản ghi ActiveRecord hoặc Message string
  def status_unprocessable_entity record_or_msg, data = nil
    message = record_or_msg
    message = record_or_msg.errors.full_messages if record_or_msg.is_a?(ActiveRecord::Base)

    render json: { message: message, data: data }.compact, status: :unprocessable_entity
  end

  def not_found klass
    render json: { message: "#{klass.name} not found" }, status: :not_found
  end

  def forbidden
    render json: { message: 'Forbidden' }, status: :forbidden
  end

  def unauthorized
    render json: { message: 'Unauthorized' }, status: :unauthorized
  end

  def render_error(message, status = :bad_request)
    render json: { errors: [{ detail: message }] }, status: status
  end
end
