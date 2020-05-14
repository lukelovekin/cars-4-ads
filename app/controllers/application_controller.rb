class ApplicationController < ActionController::Base
before_action :check_user_profile, except: [:edit, :update, :destroy, :create]

    def check_user_profile
        if user_signed_in?
            if !current_user.first_name || !current_user.username || !current_user.suburb || !current_user.state
             redirect_to edit_user_path(current_user)
            end
        end
    end

    def after_sign_in_path_for(resource)
        if !current_user.first_name || !current_user.username || !current_user.suburb || !current_user.state
            return edit_user_path(current_user)
        else
            return root_path
        end
    end

end
