module Api
  class SessionsController < ApplicationController
    include SessionsHelper
    def api_auth
      creator = Creator.find_by_email(params[:email])
      password = params[:password]
      if creator and creator.authenticate(password)
        render json: {auth_token: encodeJWT(creator)}, status: :ok
      else
        render json: {error: 'Username and password invalid'}, status: :unauthorized
      end
    end
  end
end