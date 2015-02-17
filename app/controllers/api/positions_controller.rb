class PositionsController < ApplicationController

  def index
    categories = Category.all

    respond_to do |format|
      format.json { render json: categories, status: :ok }
      format.xml { render xml: categories, status: :ok}
    end
  end
end
