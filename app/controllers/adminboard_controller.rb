class AdminboardController < ApplicationController
  before_filter :authenticate_user!
  before_filter :validate_role

  def validate_role
    redirect_to '/dashboard', status: :forbidden if !current_user.admin
  end

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to(root_path, :notice => 'User was successfully deleted.')
  end
end
