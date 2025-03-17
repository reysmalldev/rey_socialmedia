# frozen_string_literal: true

class Dashboard::User::FriendShipController < ApplicationController
  before_action :set_important_data

  def index; end

  def new
    @friend_ship = User::FriendShip.new
  end

  def create
    search_user_without_response(false)

    respond_to do |format|
      if @user.blank?
        return format.turbo_stream { render turbo_stream: turbo_stream.append('add_friend', partial: 'not_found') }
      elsif Current.user.id == @user.id
        return format.turbo_stream { render turbo_stream: turbo_stream.append('add_friend', partial: 'self_friend') }
      elsif Current.user.are_friend(@user)
        return format.json { render json: { code: 201, message: "User are already your Friend" }, status: 404 }
      end

      if friend_ships(@user.id).blank?
        friend_ship_request = Current.user.friend_ships.new(user_id: Current.user.id, target_user_id: @user.id)

        if friend_ship_request.save
          return format.html { redirect_to dashboard_user_friend_ship_path }
        else
          format.json { render json: { code: 404, message: "User not found" }, status: 404 }
        end
      end
    end
  end

  def search_user
    search_user_without_response

    respond_to do |format|
      if @user.present?
        if @user.id == Current.user.id
          format.turbo_stream { render turbo_stream: turbo_stream.update('target_friend', partial: 'self_friend') }
        elsif Current.user.are_friend?(@user)
          format.turbo_stream { render turbo_stream: turbo_stream.update('target_friend', partial: 'already_friend') }
        else
          format.turbo_stream
        end
      else
        format.turbo_stream { render turbo_stream: turbo_stream.update('target_friend', partial: 'not_found') }
      end
    end
  end

  def accept_friendship
    if friend_ship_accept_params.present?
      r = Current.user.received_friend_ships.find_by(user_id: User.find_by_username(friend_ship_accept_params[:username]).id)

      if friend_ship_accept_params[:action] == "accept"
        r.acceptance = true
      else
        r.acceptance = false
      end

      if r.save
        flash[:notice] = "Friend Accepted Successfully"
        redirect_to dashboard_user_friend_ship_path
      else
        flash[:errors] = r.errors.full_messages
        redirect_to dashboard_user_friend_ship_path
      end
    end
  end

  private

  def user_params
    params.expect(user: [:id, :username])
  end

  def friend_ship_params
    params.expect(friend_ship: [:user_id, :target_user_id])
  end

  def friend_ship_accept_params
    params.expect(friend_ship: [:action, :username])
  end

  def set_important_data
    @friends           = Current.user.friends.map(&:as_json)
    @received_requests = Current.user.received_friend_ships.where(acceptance: nil).map { |f| f.user.as_json.merge(follow_actions: true) }
    @requested_users   = Current.user.friend_ships.where(acceptance: nil).map { |f| f.target_user.as_json }
  end

  def search_user_without_response(follow_actions = true)
    @user = User.find_by(id: user_params[:id]) || User::Config.find_by(user_params)&.user
    if @user
      @user_hash = @user.as_json.with_indifferent_access.except(:password_digest, :created_at, :updated_at)
      @user_hash[:avatar] = @user.config.avatar if @user.config.avatar.attached?
      @user_hash[:username] = @user.config.username
      @user_hash[:follow_actions] = follow_actions
    end
  end

  def friend_ships(target_user_id = nil)
    @friend_ships ||= User::FriendShip.where(user_id: Current.user.id, target_user_id: target_user_id) || User::FriendShip.where(user_id: target_user_id, target_user_id: Current.user.id)
  end
end
