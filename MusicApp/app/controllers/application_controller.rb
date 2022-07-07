class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user
    # before_action :ensure_logged_in
    def current_user
        @current_user ||= User.find_by_session_token(session[:session_token])
    end

    def logged_in?
        !!current_user
    end

    def log_in_user!(user)
        session[:session_token] = user.reset_session_token
        @current_user = user
    end
    
    def logout
        @current_user = nil
        session[:session_token] = nil
    end

    def login(user)
        @user = User.find_by_credentials(
            params[:user][:email],
            params[:user][:password]
        )
        if @user
            log_in_user!(@user)
            redirect_to user_url(@user)
        else
            flash[:errors] = ["Invalid credentials"]
            render :new
        end
    end

end
