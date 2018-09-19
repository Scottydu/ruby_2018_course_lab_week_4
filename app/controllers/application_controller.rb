class ApplicationController < ActionController::API
  def require_login
    render(json: { errors: auth_service.errors }, status: :unauthorized) unless current_user
  end

  def current_user
    @current_user ||= auth_service.user if auth_service.call
  end

  private

  def auth_service
    @auth_service ||= AuthorizeApiRequest.new(request.headers)
  end
end
