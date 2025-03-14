# frozen_string_literal: true

class Dashboard::User::Posts::LikeController < ApplicationController
  def create
    if unlike_params[:unlike].present? && ((@user_post = User::Post.find_by(id: params[:user_post_id]))&.likes&.where(user_id: params[:user_id])&.size&.positive?)
      @user_post.likes.find_by(user_id: unlike_params[:user_id]).destroy!
      @liked = false
    else
      like = User::Post::Like.new(like_params)
      @user_post = like.post

      unless like.save
        flash[:alert] = "An error occurred while trying to like this post."
        redirect_to request.referer
      end

      @liked = true
    end

    respond_to do |format|
      format.turbo_stream
    end
  end

  def counter
    @user_post = User::Post.find(params[:id])
    @likes_count = @user_post.likes.count
  end

  private
  def unlike_params
    params.permit(:user_post_id, :user_id, :unlike)
  end

  def like_params
    # Warning. Here user_id is user that liked the post not the owner.
    params.permit(:user_post_id, :user_id)
  end
end
