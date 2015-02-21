module Api
  class ActivitiesController < ApplicationController
    before_action :authenticate

    def index

      if params[:sort].present? and params[:sort] === 'date'
        activities = Activity.order_by_created_desc
      elsif params[:page] and params[:size]
        # PAGINATION
        # TODO: Handle errors if params are invalid. Not DRY!! Find out how to implement named scope with parameters/variables as input.
        # Offset = (pageNr-1) * items_per_page
        offset = (params[:page].to_i - 1) * params[:size].to_i
        activities = Activity.offset(offset).limit(params[:size])
      elsif params[:offset] and params[:limit]
        activities = Activity.offset(params[:offset]).limit(params[:limit])
      else
        activities = Activity.all
      end

      respond_to do |format|
        format.json { render json: activities, status: :ok }
        format.xml { render xml: activities, status: :ok }
      end
    end

    def show
      if params[:id].present? && !is_number?(params[:id])
        # category = Category.where(category: params[:id]).first
        category = Category.find_by_category(params[:id])
        activity_by_category = category.activities

        respond_to do |format|
          format.json { render json: activity_by_category, status: :ok }
          format.xml { render xml: activity_by_category, status: :ok }
        end
      elsif params[:id].present? && is_number?(params[:id])

        activity = Activity.find(params[:id])
        render json: activity, status: :ok
      end
    end

    def create
      activity = Activity.new(
          name: params[:name],
          description: params[:description],
          indoors: params[:indoors]
      )
      activity.categories << Category.find(params[:category_id])

      if activity.save
        render json: activity, status: :created , location: api_activity_path(activity)
      else
        render json: activity.errors, status: :unprocessable_entity # 422
      end
    end

    def update
      activity = Activity.find(params[:id])
      update = activity.update(name: params[:name], description: params[:description], indoors: params[:indoors])

      if update
        render json: activity, status: :ok
      else
        render json: activity.errors, status: :unprocessable_entity
      end
    end

    def destroy
      activity = Activity.find(params[:id])
      activitycategory = Activitycategory.find_by_activity_id(params[:id])

      # Destroy relation between activity and category.
      if activity.destroy and activitycategory.destroy
        render json:activity, status: :ok
      else
        render json: activity.errors, status: :unprocessable_entity
      end
    end

    private
      # currently not used
      def activity_params
        params.require(:activity).permit(:name, :description, :indoors)
      end

      def is_number?(object)
        true if Integer(object) rescue false
      end

  end
end
