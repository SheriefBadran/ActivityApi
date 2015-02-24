module Api
  class CategoriesController < ApplicationController
    before_action :authenticate

    def index
      categories = Category.all

      respond_to do |format|
        format.json { render json: categories, status: :ok }
        format.xml { render xml: categories, status: :ok}
      end
    end

    def show
      if params[:id].present?
        category = Category.where(category: params[:category]).first
        activity_by_category = category.activities

        respond_to do |format|
          format.json {render json: activity_by_category, status: :ok}
          format.xml {render xml: activity_by_category, status: :ok}
        end
      end
    end

    private
      # Called from application_controller
      def render_unauthorized
        self.headers['WWW-Authenticate'] = 'Token realm = "Categories"'

        respond_to do |format|
          format.json {render json: '"Credentials not valid"', status: 401}
          format.xml {render xml: '<error>Credentials not valid</error>', status: 401}
        end
      end
  end
end