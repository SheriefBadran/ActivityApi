module Api
  class ActivitiesController < ApplicationController
    #before_action :authenticate_user!, only: [:update, :create, :destroy]
    before_action :authenticate
    before_action :authenticate_creator, only: [:update, :create, :destroy]
    before_action :get_activity, only: [:update, :destroy]

    def get_activity
      @activity = Activity.find(params[:id])
    end
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
      elsif params[:search] === 'true' and params[:query].present?
        activities = Activity.where('name like ?', "%#{params[:query]}%")
      elsif params[:range] and params[:position]
        positions = Position.near(params[:position], params[:range])
        activities = positions.flat_map(&:activities)
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
        return not_found if category.nil?
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
      activity = Activity.new(activity_params)
      activity.categories << Category.find(params[:category_id])

      # creator_id is set in sessions_helper.rb
      activity.creator_id = @creator_id
      if activity.save
        render json: activity, status: :created , location: api_activity_path(activity)
      else
        render json: activity.errors, status: :unprocessable_entity # 422
      end
    end

    def update
      update = @activity.update(activity_params)
      if update
        render json: @activity, status: :ok
      else
        render json: @activity.errors, status: :unprocessable_entity
      end
    end

    def destroy
      activitycategory = Activitycategory.find_by_activity_id(params[:id])
      # Destroy relation between activity and category.
      if @activity.destroy and activitycategory.destroy
        render json: @activity, status: :ok
      else
        render json: @activity.errors, status: :unprocessable_entity
      end
    end

    private
      # currently not used
      def activity_params
        params.require(:activity).permit(:name, :description, :indoors, :position_id)
      end

      def is_number?(object)
        true if Integer(object) rescue false
      end

      # Called from application_controller
      def render_unauthorized
        self.headers['WWW-Authenticate'] = 'Token realm = "Activities"'

        respond_to do |format|
          format.json {render json: '"Credentials not valid"', status: 401}
          format.xml {render xml: '<error>Credentials not valid</error>', status: 401}
        end
      end
  end
end
