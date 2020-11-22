class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

    def facebook
        @user = User.from_omniauth(auth)
         if @user.persisted?
            sign_out_all_scopes
            set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
            sign_in_and_redirect @user, event: :authentication 
        else
            session["devise.facebook_data"] = auth
            flash[:alert] = "#{auth.info.email} is already registered. Please log in instead."
            redirect_to new_user_session_path
        end
    end
    
    def google_oauth2
        @user = User.from_omniauth(auth)
         if @user.persisted?
            sign_out_all_scopes
            set_flash_message(:notice, :success, :kind => "Google") if is_navigational_format?
            sign_in_and_redirect @user, event: :authentication 
           
        else
            flash[:alert] = "#{auth.info.email} is already registered. Please log in instead."
            redirect_to new_user_session_path
        end
    end

    def failure
        redirect_to root_path
    end

    def auth
      @auth ||= request.env['omniauth.auth']
    end
end
