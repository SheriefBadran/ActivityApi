module Api
  class ActivitiesController < ApplicationController

    def index
      activities = Activity.all

      respond_to do |format|
        # Response header will show Content-Type: application/json
        format.json { render json: activities, status: 200 }

        # Response header will show Content-Type: application/xml
        # curl -IH "Access: application/xml" localhost:3000/activities
        format.xml { render xml: activities, status: 200 }

        #format.html {render }
      end
    end

    def show
      if !is_number?(params[:id])
        # category = Category.where(category: params[:id]).first
        category = Category.find_by_category(params[:id])
        activity_by_category = category.activities
        respond_to do |format|
          format.json { render json: activity_by_category, status: :ok }
          format.xml { render xml: activity_by_category, status: :ok }
        end
      else
        activity = Activity.find(params[:id])
        render json: activity, status: :ok
      end
    end

    def is_number?(object)
      true if Integer(object) rescue false
    end

  end
end
