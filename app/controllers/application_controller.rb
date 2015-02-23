class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  include Api::SessionsHelper
  protect_from_forgery with: :null_session

  before_action :set_no_cache
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  def set_no_cache
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end

  protected
    def authenticate
      authenticate_token or render_unauthorized
    end

    def authenticate_token
      # reads token of the authorization header and returns a boolean, does not halt the request.
      authenticate_with_http_token do |token, options|
        User.find_by(api_key: token)
      end
    end

    def authenticate_creator
      decodeJWT params[:token]
    end

    def not_found
      render json: 'resource not found', status: 404
    end
end

