# frozen_string_literal: true

class Dashboard::User::Posts::CommentController < ApplicationController
  def create
    puts "create comment post"
    puts "posts params:"
    puts comment_params

    respond_to do |format|
      if (@comment = User::Post::Comment.create(user_post_id: comment_params[:user_post_id], user_id: Current.user.id, content: comment_params[:content])).save
        format.turbo_stream
      end
    end
  end

  private

  def comment_params
    params.permit(:user_post_id, :content)
  end
end
