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
      if params[:id]
        activity = Activity.find(params[:id])
        render json: activity, status: :ok
      end
    end

  end
end
