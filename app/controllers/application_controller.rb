class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session

  protected
    def authenticate
      authenticate_or_request_with_http_token do |token, options|
        User.find_by(api_key: token)
      end
    end
end

