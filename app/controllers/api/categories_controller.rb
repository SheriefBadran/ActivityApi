module Api
  class CategoriesController < ApplicationController

    def index
      categories = Category.all

      respond_to do |format|
        format.json { render json: categories, status: :ok }
        format.xml { render xml: categories, status: :ok}
      end
    end

    def show

      if params[:id]
        category = Category.where(category: params[:category]).first
        activity_by_category = category.activities

        respond_to do |format|
          format.json {render json: activity_by_category, status: :ok}
          format.xml {render xml: activity_by_category, status: :ok}
        end
      end

    end

  end
end