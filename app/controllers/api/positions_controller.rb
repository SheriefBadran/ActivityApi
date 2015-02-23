module Api
  class PositionsController < ApplicationController

    def geocoder
      positions = Position.near(params[:position], params[:range])
      respond_to do |format|
        format.json {render json: positions, status: :ok}
        format.xml {render xml: positions, status: :ok}
      end
    end
  end
end
