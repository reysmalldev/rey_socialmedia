# frozen_string_literal: true

class Dashboard::PostsController < ApplicationController
  def index
    @u_posts = Current.user.posts.limit(4)
  end

  def others
    @posts = User::Post.all

    format.turbo_stream
  end
end
