class SessionsController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  before_action :redirect_authenticated, if: :authenticated?, only: %w[ new create]

  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_url, alert: "Try again later." }

  def new
    puts controller_name
    puts action_name
  end

  def create
    user = User.find_by(email_address: params[:login]) || User::Config.find_by(username: params[:login])&.user

    if user&.authenticate(sessions_params[:password])
      start_new_session_for user
      redirect_to after_authentication_url
    else
      redirect_to new_session_path, alert: "Try another email address or password."
    end
  end

  def redirect_authenticated
    redirect_to after_authentication_url
  end

  def destroy
    terminate_session
    redirect_to new_session_path, notice: "You have been logged out."
  end

  private

  def sessions_params
    params.permit(:login, :password)
  end
end
