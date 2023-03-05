module ErrorHandler
  def self.included(clazz)
    clazz.class_eval do
      rescue_from ActiveRecord::RecordNotFound, with: :error_occurred
      rescue_from NameError, with: :error_occurred
      rescue_from ActionController::RoutingError, with: :error_occurred
    end
  end

  private

  def error_occurred(exception)
    validate_response(exception.to_s)
  end
end
