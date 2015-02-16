class HomeController < ApplicationController

  def index

    if user_signed_in? && current_user.admin
      redirect_to adminboard_index_path

    # Redirect user to the dashboard.
    elsif user_signed_in?
      redirect_to dashboard_index_path
    end
  end
end
