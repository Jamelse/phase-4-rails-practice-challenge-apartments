class ApplicationController < ActionController::API

rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_error_message
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_error_message

  private 

  def unprocessable_entity_error_message(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end

  def record_not_found_error_message(invalid)
    render json: { error: "#{invalid.model} not found"}, status: :not_found
  end

end
