class Dashboard::UserController < ApplicationController
  def show
    @user = User.find(user_params[:id]) || User.find_by_username(user_params[:username])
  end

  private

  def user_params
    params.permit(:id, :username)
  end
end
