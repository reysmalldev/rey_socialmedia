class Dashboard::User::SettingsController < ApplicationController
  def edit
    @user = Current.user
  end
  def update
    puts "all params: #{params}"
    puts "afafa #{settings_params}"
    puts "email: #{settings_params[:email_address]}, username: #{settings_params[:username]}"
    updated_user = Current.user.update(user_params)

    if updated_user && Current.user.config.update(config_params)
      flash[:notice] = "Successfully updated."
    else
      flash[:error] = "Did no updated successfully."
    end

    redirect_to request.referer
  end

  private

  def settings_params
    params.expect(user: [:email_address, :username, :password, :avatar])
  end

  def user_params
    {email_address: settings_params[:email_address]}
  end

  def config_params
    {username: settings_params[:username], avatar: settings_params[:avatar]}
  end
end
