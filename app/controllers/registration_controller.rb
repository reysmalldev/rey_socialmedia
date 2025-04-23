class RegistrationController < ApplicationController
  allow_unauthenticated_access only: %i[ index create ]

  def index
    @user = User.new
  end

  def create
    @user = User.create(registration_params.except(:username))

    if @user.save
      config = User::Config.create(user_id: @user.id, username: registration_params[:username])

      if config.save
        redirect_to root_path, notice: "Successfully created an account."
      else
        flash[:errors] = config.errors.full_messages
        redirect_to registration_index_path
      end
    else
      puts "error"
      puts @user.errors.full_messages
      flash[:errors] = @user.errors.full_messages
      redirect_to registration_index_path, errors: @user.errors.full_messages
    end
  end

  private

  def registration_params
    params.expect(user: [:username, :email_address, :password, :password_confirmation])
  end
end
