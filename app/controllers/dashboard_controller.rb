class DashboardController < ApplicationController
    def root
        if authenticated?
            redirect_to dashboard_index_path
        else
            redirect_to new_session_path
        end
    end

    def index
        @users = User.all.limit(5)
    end
end
