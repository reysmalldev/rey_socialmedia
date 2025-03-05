class DashboardController < ApplicationController
    def root
        redirect_to new_session_path
    end

    def index
        @users = User.all.limit(5)
    end

    def posts
        @posts = Current.user.posts.limit(5)
    end
end
