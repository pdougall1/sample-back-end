class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_filter :authenticate

  def current_user
    @authenticated_user
  end

  private

  def authenticate
    authenticate_user_from_token || render_unauthorized
  end

  def authenticate_user_from_token
    if auth_headers = request.headers['Authorization']
      auth = JSON.parse(auth_headers)
      identifier = auth['identification']
      @authenticated_user = identifier && AR::User.where(email: identifier).first
      @authenticated_user && @authenticated_user.authentication_token.matches_and_valid?(auth['authentication_token'])
    end
  end

  def render_unauthorized
    self.headers['WWW-Authenticate'] = 'Token realm="Application"'
    render json: {"error" => 'You must provide a valid token'}, status: 401
  end
end
