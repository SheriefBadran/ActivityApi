module Api
  class PositionsController < ApplicationController

    def geocoder
      positions = Position.near(params[:position], params[:range])
      respond_to do |format|
        format.json {render json: positions, status: :ok}
        format.xml {render xml: positions, status: :ok}
      end
    end

    def create
      position = Position.new(position_params)
      if position.save
        render json: position, status: :created, location: ''
      end
    end

    private
    def position_params
      params.require(:position).permit(:address)
    end
  end
end
