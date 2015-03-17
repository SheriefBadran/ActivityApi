module Api
  class CreatorsController < ApplicationController
    before_action :authenticate

    def index
      if params[:search] === 'true' and params[:query].present?
        creators = Creator.where('email like ?', "%#{params[:query]}%")
      else
        creators = Creator.all
      end

      respond_to do |format|
        format.json { render json: creators, status: :ok }
        format.xml { render xml: creators, status: :ok}
      end
    end

    def show
      if params[:id].present?
        creator = Creator.find(params[:id])
        activities = creator.activities

        respond_to do |format|
          format.json { render json: activities, status: :ok }
          format.xml { render xml: activities, status: :ok }
        end
      end
    end

    private
    # Called from application_controller
    def render_unauthorized
      self.headers['WWW-Authenticate'] = 'Token realm = "Creators"'

      respond_to do |format|
        format.json {render json: '"Credentials not valid"', status: 401}
        format.xml {render xml: '<error>Credentials not valid</error>', status: 401}
      end
    end

  end
end
